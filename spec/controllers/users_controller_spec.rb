require 'spec_helper'

describe UsersController do  
  it "create action renders new template when model is valid" do
    User.any_instance.stubs(:valid?).returns(true)
    post :create
    response.should render_template(:new)
  end
end
