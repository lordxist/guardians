require 'spec_helper'

describe StarshipsController do
  setup :activate_authlogic, :create_user_session

  it "'s update action redirects to the homepage if no user is logged in" do
    destroy_user_session
    post 'update'
    response.should redirect_to(root_path)
  end
  
  it "'s update action redirects to the game page if successful" do
    stub_starship
    Starship.any_instance.stubs(:each).returns(nil)
    Starship.any_instance.stubs(:save).returns(true)
    post 'update'
    response.should redirect_to(:controller => "game")
  end
  
  it "'s update action redirects to the game page if unsuccessful" do
    stub_starship
    Starship.any_instance.stubs(:each).returns(nil)
    Starship.any_instance.stubs(:valid?).returns(false)
    post 'update'
    response.should redirect_to(:controller => "game")
  end
  
  it "updates all starships before update" do
    should_update_all_starships_before 'update'
  end
end
