require 'spec_helper'

describe Starsystem do
  it "has a name including at least its coordinates" do
    starsystem = Starsystem.at(0, 0)
    starsystem.name.should include("0,0")
  end
  
  it "has a name including its planet's name when it has one" do
    Factory(:planet, :name => "MyPlanet", :x_pos => 0, :y_pos => 0)
    starsystem = Starsystem.at(0, 0)
    starsystem.name.should include("MyPlanet")
  end
end
