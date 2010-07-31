require 'spec_helper'

describe Planet do
  it "has a name" do
    Factory(:planet).name.should_not be_nil
  end
  
  it "has a x_pos" do
    Factory(:planet).x_pos.should_not be_nil
  end
  
  it "has a y_pos" do
    Factory(:planet).y_pos.should_not be_nil
  end
  
  it "'s name must not be changed" do
    planet = Factory(:planet, :name => "Test")
    planet.name = "Test II"
    planet.should_not be_valid
  end
  
  it "'s x_pos must not be changed" do
    planet = Factory(:planet, :x_pos => 5)
    planet.x_pos = 0
    planet.should_not be_valid
  end
  
  it "'s y_pos must not be changed" do
    planet = Factory(:planet, :y_pos => 5)
    planet.y_pos = 0
    planet.should_not be_valid
  end
  
  it "has credits" do
    Factory(:planet).credits.should_not be_nil
  end
  
  it "has durasteel" do
    Factory(:planet).durasteel.should_not be_nil
  end
  
  it "has plasteel" do
    Factory(:planet).plasteel.should_not be_nil
  end
  
  it "has tibanna" do
    Factory(:planet).tibanna.should_not be_nil
  end
end
