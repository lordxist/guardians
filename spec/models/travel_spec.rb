require 'spec_helper'

describe Travel do
  it "returns the correct arrival time" do
    Factory(:travel).arrival_time.future?.should be_true
  end

  it "returns the correct time until arrival" do
    travel = Factory(:travel)
    travel.stubs(:arrival_time).returns(Time.zone.now + 60)
    travel.arrival_in.to_i.should eql(59)

    travel.stubs(:arrival_time).returns(Time.zone.now + 30)
    travel.arrival_in.to_i.should eql(29)
  end

  it "returns its destination starsystem" do
    Factory(:travel).destination.should be_kind_of(Starsystem)
  end

  it "returns whether it's ended" do
    Factory(:travel).ended?.should be_false

    travel = Factory(:travel)
    travel.stubs(:arrival_time).returns(Time.zone.now - 60)
    travel.ended?.should be_true
  end
end
