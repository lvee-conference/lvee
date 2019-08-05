require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe ConferenceRegistrationsController do
  render_views

  #Delete this example and add some real ones
  it "should show new page" do
    user = FactoryBot.create :user, :admin

    conference = FactoryBot.create :conference, :in_future

    login_as user

    get :new, user_id: user.id, conference_id: conference.id
  end

end
