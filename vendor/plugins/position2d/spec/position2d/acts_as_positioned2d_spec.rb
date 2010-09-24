require File.dirname(__FILE__) + '/../spec_helper'

describe "acts_as_positioned2d" do
  before(:each) do
    build_model :positioned do
      integer :x_coord
      integer :y_coord
      
      acts_as_positioned2d
    end
  end
  
  it "at returns the correct objects" do
    positioned = Positioned.create(:x_coord => 0, :y_coord => 0)
    positioned2 = Positioned.create(:x_coord => 1, :y_coord => 0)
    positioned3 = Positioned.create(:x_coord => 0, :y_coord => 0)
    Positioned.at_coords(0, 0)[0].should eql(positioned)
    Positioned.at_coords(0, 0)[1].should eql(positioned3)
  end
end
