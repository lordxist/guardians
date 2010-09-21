require 'spec_helper'

describe Starship do
  it "has a starsystem" do
    Factory(:starship).starsystem.should be_kind_of(Starsystem)
  end

  it "returns the other starships on its position" do
    starship = Factory(:starship, :x_coord => 1, :y_coord => 1)
    starship2 = Factory(:starship, :x_coord => 1, :y_coord => 1)
    starship3 = Factory(:starship, :x_coord => 1, :y_coord => 1)
    starship4 = Factory(:starship, :x_coord => 2, :y_coord => 1)
    starship.starships_on_same_position.should eql([starship2, starship3])
  end

  it "builds a travel with the start coordinates as default" do
    starship = Factory(:starship, :x_coord => 1, :y_coord => 2)
    travel = starship.build_travel
    travel.x_start.should eql(1)
    travel.y_start.should eql(2)
  end
  
  it "destroys the travel after it has ended" do
    starship = Factory(:starship)
    travel = Factory(:travel)
    travel.stubs(:ended?).returns(true)
    travel.expects(:destroy)
    starship.stubs(:travel).returns(travel)
    starship.save
  end

  it "sets its coords according to the travel's destination after its end" do
    starship = Factory(:starship)
    travel = Factory(:travel, :x_dest => 10, :y_dest => 20)
    travel.stubs(:ended?).returns(true)
    starship.stubs(:travel).returns(travel)
    starship.save
    starship.x_coord.should eql(10)
    starship.y_coord.should eql(20)
  end

  it "returns an empty array for its trade partners when travelling" do
    starship = Factory(:starship)
    starship.build_travel
    starship.trade_partners.should be_empty
  end
end
