require File.dirname(__FILE__) + '/spec_helper'

include Position2D

describe Base do  
  it "at takes two integers as parameters and returns its kind" do
    Base.at(0, 0).should be_kind_of(Base)
  end
  
  it "cannot be initialized with new" do
    lambda { Base.new(0, 0) }.should raise_error
  end
  
  it "has an x_coord set correctly" do
    Base.at(0, 1).x_coord.should eql(0)
    Base.at(1, 0).x_coord.should eql(1)
  end
  
  it "has a y_coord set correctly" do
    Base.at(0, 1).y_coord.should eql(1)
    Base.at(1, 0).y_coord.should eql(0)
  end
  
  describe "dynamic object(s) at same position" do
    before(:each) do
      Object.stubs(:at).returns(["test"])
    end
    
    it "(plural) returns the correct list" do
      Base.at(0, 0).objects.should eql(["test"])
    end
    
    it "(singular) returns a single object" do
      Base.at(0, 0).object.should eql("test")
    end
  end
end
