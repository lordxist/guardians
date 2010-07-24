require 'spec_helper'

describe UsersController do
  it "'s create action redirects to new with param successful if it indeed is" do
    User.any_instance.stubs(:valid?).returns(true)
    post 'create'
    response.should redirect_to(new_user_path(:successful => true))
  end
end
