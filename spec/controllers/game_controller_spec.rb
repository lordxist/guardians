require 'spec_helper'
require 'authlogic/test_case'

describe GameController do
  setup :activate_authlogic, :create_user_session

  it "redirects to the homepage if no user is logged in" do
    destroy_user_session
    get 'index'
    response.should redirect_to(root_path)
  end
end
