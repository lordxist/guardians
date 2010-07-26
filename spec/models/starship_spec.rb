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
  
  it "'s name is always present" do
    starship = Factory(:starship)
    starship.name = nil
    starship.should_not be_valid
  end
  
  it "'s x_pos is always present" do
    starship = Factory(:starship)
    starship.x_pos = nil
    starship.should_not be_valid
  end
  
  it "'s y_pos is always present" do
    starship = Factory(:starship)
    starship.y_pos = nil
    starship.should_not be_valid
  end
  
  it "'s position method returns x_pos and y_pos separated by a comma" do
    starship = Factory(:starship)
    starship.position.should eql(starship.x_pos.to_s + "," + starship.y_pos.to_s)
  end
  
  it "'s arrival_time is protected" do
    starship = Factory(:starship)
    starship.update_attributes(:arrival_time => Time.zone.now)
    starship.arrival_time.should be_nil
  end
  
  it "sets the correct arrival_time on position change" do
    starship = Factory(:starship)
    starship.update_attributes(:x_pos => 100, :y_pos => 100)
    starship.update_attribute(:arrival_time, nil)
    starship.update_attributes(:x_pos => 150, :y_pos => 150)
    starship.arrival_time.should be_close(Time.zone.now + 100, 0.01)
  end
  
  it "unsets arrival_time on update if arrived" do
    starship = Factory(:starship, :arrival_time => Time.zone.now - 1)
    starship.save!
    starship.arrival_time.should be_nil
  end
  
  it "has a speed" do
    Factory(:starship).speed.should_not be_nil
  end
  
  it "'s speed is always present" do
    starship = Factory(:starship)
    starship.speed = nil
    starship.should_not be_valid
  end
  
  it "'s arrival_in method returns nil if not travelling" do
    Factory(:starship).arrival_in.should be_nil
  end
  
  it "'s arrival_in method returns the correct time if travelling" do
    starship = Factory(:starship, :arrival_time => Time.zone.now + 30)
    starship.arrival_in.to_s(:countdown).should eql("00:29")
  end
end
