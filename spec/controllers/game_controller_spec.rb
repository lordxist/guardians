require 'spec_helper'

describe GameController do
  it "redirects to the homepage if no user is logged in" do
    get 'index'
    response.should redirect_to(root_path)
  end
end
