require 'spec_helper'

describe StarshipsController do
  setup :activate_authlogic, :create_user_session, :stub_starship

  it "'s update action redirects to the homepage if no user is logged in" do
    destroy_user_session
    post 'update'
    response.should redirect_to(root_path)
  end

  it "'s update action redirects to the game page if successful" do
    post 'update'
    response.should redirect_to(:controller => "game")
  end
  
  it "'s update action redirects to the game page if unsuccessful" do
    Starship.any_instance.stubs(:valid?).returns(false)
    post 'update'
    response.should redirect_to(:controller => "game")
  end
end
