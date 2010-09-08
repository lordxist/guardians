require 'spec_helper'

describe Travel do
  it "requires an x_start" do
    lambda { Factory(:travel, :x_start => nil) }.should raise_exception
  end
  
  it "requires a y_start" do
    lambda { Factory(:travel, :y_start => nil) }.should raise_exception
  end
  
  it "requires an x_dest" do
    lambda { Factory(:travel, :x_dest => nil) }.should raise_exception
  end
  
  it "requires a y_dest" do
    lambda { Factory(:travel, :y_dest => nil) }.should raise_exception
  end
  
  it "requires a speed" do
    lambda { Factory(:travel, :speed => nil) }.should raise_exception
  end
  
  it "returns the correct arrival time" do
    travel = Factory(:travel)
    travel.arrival_time.should be_close(Time.zone.now + 100, 0.1)
  end
  
  it "arrival_in returns the correct timeframe" do
    travel = Factory(:travel)
    travel.arrival_in.to_i.should be_close(100, 1.01)
  end
  
  it "returns the correct destination" do
    travel = Factory(:travel)
    travel.destination.should be_kind_of(Starsystem)
    travel.destination.x_coord.should eql(50)
    travel.destination.y_coord.should eql(50)
  end
  
  it "ended? returns false when arrival_time isn't over" do
    travel = Factory(:travel)
    travel.ended?.should be_false
  end
  
  it "ended? returns true when arrival_time is over" do
    travel = Factory(:travel)
    travel.stubs(:arrival_time).returns(Time.zone.now)
    travel.ended?.should be_true
  end
end
