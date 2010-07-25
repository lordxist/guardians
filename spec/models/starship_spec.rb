require 'spec_helper'

describe Starship do
  it "has a name" do
    Factory(:starship).name.should_not be_nil
  end
  
  it "has a x_pos" do
    Factory(:starship).x_pos.should_not be_nil
  end
  
  it "has a y_pos" do
    Factory(:starship).y_pos.should_not be_nil
  end
  
  it "'s position method returns x_pos and y_pos separated by a comma" do
    starship = Factory(:starship)
    starship.position.should eql(starship.x_pos.to_s + "," + starship.y_pos.to_s)
  end
end
