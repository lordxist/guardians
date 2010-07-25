require 'spec_helper'

describe User do
  it "has a starship" do
    assert Factory(:user).starship
  end
end
