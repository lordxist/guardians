require File.dirname(__FILE__) + '/../spec_helper'

describe "acts_as_positioned2d" do
  before(:each) do
    build_model :positioned do
      integer :x_pos
      integer :y_pos
      
      acts_as_positioned2d
    end
  end
  
  it "at returns the correct objects" do
    positioned = Positioned.new(:x_pos => 0, :y_pos => 0)
    positioned2 = Positioned.new(:x_pos => 1, :y_pos => 0)
    positioned3 = Positioned.new(:x_pos => 0, :y_pos => 0)
    Positioned.at(0, 0).should eql([positioned, positioned3])
  end
end
