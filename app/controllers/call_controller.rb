class CallController < ApplicationController
  before_filter :admin_required

  def search
    search_word = params[:word] || " "
    result = []
    users = User.where('login LIKE :login OR first_name LIKE :first_name OR last_name LIKE :last_name',
                       login: "%#{search_word}%",
                       first_name: "%#{search_word}%",
                       last_name: "%#{search_word}%").order(:last_name => :asc, :first_name => :asc) # TODO: безопасность

    result = {'error' => 'users not found'} if users.empty?

    users.each do |user|
      conference_registration = ConferenceRegistration.where(user_id: user.id).order(:id).last
      next if conference_registration.nil?
      result << {
          id: user.id,
          login: user.login,
          first_name: user.first_name,
          last_name: user.last_name,
          phone: conference_registration.phone,
          from: user.from
      }
    end

    result = {'error' => 'numbers not found'} if result.empty?

    respond_to do |format|
      format.json { render :json => result}
    end
  end

  def current_conference
    result = []
    ConferenceRegistration.where(:conference_id => Conference.last.id).each do |reg|
      if reg.phone.nil?
        other_registrations = ConferenceRegistration.where('user_id = :user_id AND phone IS NOT NULL', user_id: reg.user.id).order(:id).last
        reg = other_registrations unless other_registrations.nil?
      end

      result << {
          id: reg.user.id,
          login: reg.user.login,
          first_name: reg.user.first_name,
          last_name: reg.user.last_name,
          phone: reg.phone.to_s.gsub(/([\d\+ \(\)-\.]+)/).to_a.join(" ").strip,
          from: reg.user.from
      }
    end

    result = {'error' => 'numbers not found'} if result.empty?

    result.sort! { |a,b| [a[:last_name], a[:first_name]] <=> [b[:last_name], b[:first_name]] }

    respond_to do |format|
      format.json { render :json => result}
    end
  end
end
