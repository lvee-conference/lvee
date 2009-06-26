require 'digest/sha1'
class User < ActiveRecord::Base
  file_column(:avator,
    :magick => {
      :size => AVATAR_SIZE,
      :versions => {
        :list => LIST_AVATAR_SIZE
      }})

  has_many :conference_registrations, :dependent => :delete_all

  # Authorization plugin
  # acts_as_authorized_user
  # acts_as_authorizable

  # Virtual attribute for the unencrypted password
  attr_accessor :password

  REQUIRED_FIELDS = [:login, :email, :first_name, :last_name, :country, :city, :occupation]

  validates_presence_of *REQUIRED_FIELDS

  validates_presence_of     :password,                   :if => :password_required?
  validates_presence_of     :password_confirmation,      :if => :password_required?

  validates_length_of       :password, :within => 4..40, :if => :password_required?, :allow_blank => true


  validates_confirmation_of :password,                   :if => :password_required?

  validates_format_of :email, :with => /^[a-zA-Z0-9\-\._]+\@[a-zA-Z0-9\-\.]+\.([a-zA-Z]{2,4}|[0-9]{1,4})$/ix

  validates_length_of       :login, :within => 3..40

  validates_length_of       :first_name, :within => 2..30, :allow_blank => true
  validates_length_of       :last_name, :within => 2..30,  :allow_blank => true

  validates_uniqueness_of   :login
  validates_presence_of     :email, :case_sensitive => false

  before_save   :encrypt_password
  before_create :make_activation_code

  # prevents a user from submitting a crafted form that bypasses activation
  # anything else you want your user to change should be added here.
  attr_accessible :login, :first_name, :last_name, :country, :city, :projects, :occupation, :email, :password, :password_confirmation, :subscribed, :avator, :avator_temp

  def full_name
    "#{first_name} #{last_name}"
  end

  def from
    "#{city}, #{country}"
  end

  # Activates the user in the database.
  def activate
    @activated = true
    self.activated_at = Time.now.utc
    self.activation_code = nil
    save(false)
  end

  def active?
    # the existence of an activation code means they have not activated yet
    activation_code.nil?
  end

  # Authenticates a user by their login name and unencrypted password.  Returns the user or nil.
  def self.authenticate(login, password)
    u = find :first, :conditions => ['login = ? and activated_at IS NOT NULL', login] # need to get the salt
    u && u.authenticated?(password) ? u : nil
  end

  # Encrypts some data with the salt.
  def self.encrypt(password, salt)
    Digest::SHA1.hexdigest("--#{salt}--#{password}--")
  end

  # Encrypts the password with the user salt
  def encrypt(password)
    self.class.encrypt(password, salt)
  end

  def authenticated?(password)
    crypted_password == encrypt(password)
  end

  def remember_token?
    remember_token_expires_at && Time.now.utc < remember_token_expires_at
  end

  # These create and unset the fields required for remembering users between browser closes
  def remember_me
    remember_me_for 2.weeks
  end

  def remember_me_for(time)
    remember_me_until time.from_now.utc
  end

  def remember_me_until(time)
    self.remember_token_expires_at = time
    self.remember_token            = encrypt("#{email}--#{remember_token_expires_at}-")
    save(false)
  end

  def forget_me
    self.remember_token_expires_at = nil
    self.remember_token            = nil
    save(false)
  end

  # Returns true if the user has just been activated.
  def recently_activated?
    @activated
  end

  def editable_by?(user)
    self.id == user.id # by self and only self ;)
  end

  def admin?
    self.role == 'admin'
  end

  def editor?
    ['admin', 'editor'].include?(self.role)
  end

  def self.valid_data
    {:login => 'login', :email => 'user@example.com',
      :first_name => 'Vasiliy', :last_name=> 'Pupkin',
      :country => 'Belarus', :city => 'Minsk',
      :password => '1234',
      :password_confirmation => '1234',
      :occupation => "Some",
      :projects => "Any"}
  end

  def to_s
    "#{full_name}"
  end

  def after_save
    if subscribed?
      MaillistSubscriber.subscribe(ALL_USER_MAILLIST, self.email) if active?
    else
      MaillistSubscriber.unsubscribe(ALL_USER_MAILLIST, self.email)
    end
  end

  protected
  # before filter
  def encrypt_password
    return if password.blank?
    self.salt = Digest::SHA1.hexdigest("--#{Time.now.to_s}--#{login}--") if new_record?
    self.crypted_password = encrypt(password)
  end

  def password_required?
    crypted_password.blank? || !password.blank?
  end

  def make_activation_code
    self.activation_code = Digest::SHA1.hexdigest( Time.now.to_s.split(//).sort_by {rand}.join )
  end
end
