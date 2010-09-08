require 'spec_helper'

describe Starship do
=begin
  it "has a name" do
    Factory(:starship).name.should_not be_nil
  end
  
  it "has a x_pos" do
    Factory(:starship).x_pos.should_not be_nil
  end
  
  it "has a y_pos" do
    Factory(:starship).y_pos.should_not be_nil
  end
=end
  it "requires a name" do
    lambda { Factory(:starship, :name => nil) }.should raise_exception
  end
  
  it "requires an x_pos" do
    lambda { Factory(:starship, :x_pos => nil) }.should raise_exception
  end
  
  it "requires a y_pos" do
    lambda { Factory(:starship, :y_pos => nil) }.should raise_exception
  end
  
  it "returns a starsystem" do
    Factory(:starship).starsystem.should be_kind_of(Starsystem)
  end
  
  it "returns the other starships on its position" do
    starship = Factory(:starship)
    starship2 = Factory(:starship)
    starship3 = Factory(:starship)
    starship.starships_on_same_position.should eql([starship2, starship3])
  end
  
  it "updates related game objects" do
    starship = Factory(:starship)
    Factory(:starship)
    Starship.any_instance.expects(:save).times(2)
    starship.update_related_game_objects
  end
  
  it "doesn't update unrelated game objects" do
    starship = Factory(:starship)
    Factory(:starship, :x_pos => 1)
    Starship.any_instance.expects(:save)
    starship.update_related_game_objects
  end
  
  it "creates a travel when its x_pos is changed" do
    starship = Factory(:starship)
    starship.update_attributes(:x_pos => 50)
    starship.travel.should_not be_nil
  end
  
  it "creates a travel when its y_pos is changed" do
    starship = Factory(:starship)
    starship.update_attributes(:y_pos => 50)
    starship.travel.should_not be_nil
  end
  
  it "destroys its travel when it has ended" do
    starship = Factory(:starship)
    starship.update_attributes(:x_pos => 50)
    starship.travel.stubs(:ended?).returns(true)
    starship.save
    starship.travel.should be_nil
  end
=begin
  it "'s x_pos may not be changed if travelling" do
    starship = Factory(:starship, :arrival_time => Time.zone.now + 60)
    starship.x_pos = 5
    starship.should_not be_valid
  end
  
  it "'s y_pos may not be changed if travelling" do
    starship = Factory(:starship, :arrival_time => Time.zone.now + 60)
    starship.y_pos = 5
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
  
  it "has a speed" do
    Factory(:starship).speed.should_not be_nil
  end
  
  it "'s speed is always present" do
    starship = Factory(:starship)
    starship.speed = nil
    starship.should_not be_valid
  end
  
  it "'s arrival_in method returns nil if not travelling" do
    starship = Factory(:starship, :arrival_time => Time.zone.now - 60)
    starship.arrival_in.should be_nil
  end
  
  it "'s arrival_in method returns the correct time if travelling" do
    starship = Factory(:starship, :arrival_time => Time.zone.now + 30)
    starship.arrival_in.to_s(:countdown).should eql("00:29")
  end
  
  it "'s travelling? method returns true if it indeed is" do
    starship = Factory(:starship, :arrival_time => Time.zone.now + 60)
    starship.travelling?.should be_true
  end
  
  it "'s travelling? method returns false if arrival_time is past" do
    starship = Factory(:starship, :arrival_time => Time.zone.now - 60)
    starship.travelling?.should be_false
  end
  
  it "'s travelling? method returns false if arrival_time is nil" do
    starship = Factory(:starship)
    starship.travelling?.should be_false
  end
  
  it "'s starships_on_same_position method returns the correct starships" do
    starship = Factory(:starship)
    starship2 = Factory(:starship)
    starship3 = Factory(:starship, :x_pos => 1)
    starship.starships_on_same_position.should eql([starship2])
    
    starship = Factory(:starship, :arrival_time => Time.zone.now + 60)
    starship.starships_on_same_position.should be_empty
  end
  
  it "'s planet_on_same_position method returns the correct planet" do
    planet = Factory(:planet)
    starship = Factory(:starship)
    starship.planet_on_same_position.should eql(planet)
    
    starship = Factory(:starship, :arrival_time => Time.zone.now + 60)
    starship.planet_on_same_position.should be_nil
  end
  
  it_trades_correctly(:starship)
=end
end
