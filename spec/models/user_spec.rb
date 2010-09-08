require 'spec_helper'

describe User do
  it "requires a starship" do
    user = Factory :user
    user.starship = nil
    user.should have(1).error_on(:starship)
  end
end
