require 'spec_helper'
require 'authlogic/test_case'

describe UserSessionsController do
  setup :activate_authlogic

  it "'s create action redirects to the game page if successful" do
    UserSession.any_instance.stubs(:save).returns(true)
    post 'create'
    response.should redirect_to(:controller => 'game')
  end
  
  it "'s create action redirects to the homepage if unsuccessful" do
    post 'create'
    response.should redirect_to(root_path)
  end
  
  it "'s destroy action redirects to the homepage if successful" do
    UserSession.create Factory(:user)
    delete 'destroy'
    response.should redirect_to(root_path)
  end
end
