require 'spec_helper'

describe Starsystem do
  it "has a name according to its coordinates" do
    starsystem = Starsystem.at_coords(0, 0)
    starsystem.name.should eql("(0,0)")

    starsystem = Starsystem.at_coords(0, 100)
    starsystem.name.should eql("(0,100)")
  end
end
