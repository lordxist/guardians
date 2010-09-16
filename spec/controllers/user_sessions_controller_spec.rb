require 'spec_helper'

require 'authlogic/test_case'

include Authlogic::TestCase

describe UserSessionsController do
  setup :activate_authlogic

  it "create action redirects to the game page" do
    post :create
    response.should redirect_to(game_url)
  end

  it "logout (destroy/0) redirects to the homepage" do
    UserSession.create(Factory(:user))
    delete :destroy, :id => 0
    response.should redirect_to(root_url)
  end
end
