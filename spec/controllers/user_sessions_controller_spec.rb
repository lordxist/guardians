require 'spec_helper'

describe UserSessionsController do  
  it "create action redirects to the game page when successful" do
    UserSession.any_instance.stubs(:save).returns(true)
    post :create
    response.should redirect_to(game_path)
  end
  
  it "create action redirects to the homepage when unsuccessful" do
    post :create
    response.should redirect_to(root_path)
  end
  
  it "destroy action redirects to the homepage" do
    NilClass.any_instance.stubs(:destroy).returns(true)
    delete :destroy
    response.should redirect_to(root_path)
  end
end
