class MaillistSubscription < ApplicationRecord
  attr_accessible :email, :maillist
  validates :email, :uniqueness => {:scope => :maillist}
end
