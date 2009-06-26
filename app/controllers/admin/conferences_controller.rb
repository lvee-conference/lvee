module Admin
  class ConferencesController < ApplicationController
    before_filter :admin_required, :scaffold_action

    USER_CSV_COLUMNS = [:login, :full_name, :email, :country, :city, :occupation, :projects]
    REGISTRATION_CSV_COLUMNS = [:status_name, :comment, :proposition, :quantity, :days, :meeting, :phone, :residence, :floor, :transport_to, :transport_from, :food, :tshirt]

    BADGE_USER_COLUMNS = [:login, :full_name, :from]
    BADGE_COLUMNS = [:tags, :top, :bottom]

    layout "admin"
    active_scaffold :conferences do |config|
      config.columns = [:name, :start_date, :finish_date, :registration_opened]
      config.columns[:registration_opened].form_ui = :checkbox
      config.action_links <<
        ActiveScaffold::DataStructures::ActionLink.new(:csv, :label => :csv_export, :type => :record, :inline => false, :parameters => {:format =>"csv" })
      config.action_links <<
        ActiveScaffold::DataStructures::ActionLink.new(:badges_csv, :label => :badges_csv_export, :type => :record, :inline => false, :parameters => {:format =>"csv" })
    end

    def csv
      out = FasterCSV.generate do |csv|
        header = USER_CSV_COLUMNS.map {|c| t("label.user.#{c}") }
        header += REGISTRATION_CSV_COLUMNS.map {|c| t("label.conference_registration.#{c}") }
        csv << header

        regs = ConferenceRegistration.find_all_by_conference_id(params[:id])
        regs.each do |reg|
          row = USER_CSV_COLUMNS.map {|c| reg.user.send(c) }
          row += REGISTRATION_CSV_COLUMNS.map {|c| reg.send(c) }
          row.map!{ |i| i.to_s.gsub("\n", " ").gsub("\r", " ")}
          csv << row
        end
      end
      render :text => out, :content_type => "text/csv"
    end

    def badges_csv
      out = FasterCSV.generate do |csv|
        header = BADGE_USER_COLUMNS.map {|c| t("label.user.#{c}") }
        header += BADGE_COLUMNS.map {|c| t("label.badge.#{c}") }
        csv << header

        conf = Conference.find(params[:id])
        badges = conf.badges
        badges.each do |badge|
          user = badge.conference_registration.user
          row = BADGE_USER_COLUMNS.map {|c| user.send(c) }
          row += BADGE_COLUMNS.map {|c| badge.send(c) }
          row.map!{ |i| i.to_s.gsub("\n", " ").gsub("\r", " ")}
          csv << row
        end
      end
      render :text => out, :content_type => "text/csv"
    end

  end
end
