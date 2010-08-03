require 'spec_helper'

describe Starship do
  it "has a name" do
    Factory(:starship).name.should_not be_nil
  end
  
  it "has a x_pos" do
    Factory(:starship).x_pos.should_not be_nil
  end
  
  it "has a y_pos" do
    Factory(:starship).y_pos.should_not be_nil
  end
  
  it "'s name is always present" do
    starship = Factory(:starship)
    starship.name = nil
    starship.should_not be_valid
  end
  
  it "'s x_pos is always present" do
    starship = Factory(:starship)
    starship.x_pos = nil
    starship.should_not be_valid
  end
  
  it "'s x_pos may not be changed if travelling" do
    starship = Factory(:starship, :arrival_time => Time.zone.now + 60)
    starship.x_pos = 5
    starship.should_not be_valid
  end
  
  it "'s y_pos is always present" do
    starship = Factory(:starship)
    starship.y_pos = nil
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
  
  [:credits, :durasteel, :plasteel, :tibanna].each do |field|
    it "'s #{field} is/are always at least zero" do
      always_at_least_zero(field)
    end
  end
  
  ["durasteel", "plasteel", "tibanna"].each do |field|    
    ["selling", "buying"].each do |prefix|
      it "'s #{prefix}_#{field} is/are always at least zero" do
        always_at_least_zero((prefix+"_"+field).to_sym)
      end
      
      it "'s #{prefix}_#{field}_price is always greater than zero" do
        always_greater_than_zero((prefix+"_"+field+"_price").to_sym)
      end
    end
    
    it "'s never buying and selling #{field} at the same time" do
      starship = Factory(:starship, "buying_#{field}" => 300)
      starship.attributes = {"selling_#{field}" => 300}
      starship.should_not be_valid
    end
    
    it "buys #{field} correctly if set to do so" do
      starship = Factory(:starship, :credits => 100, "buying_#{field}" => 10, "buying_#{field}_price" => 2)
      Factory(:starship, field => 20, "selling_#{field}" => 0, "selling_#{field}_price" => 2)
      starship.save
      starship[field.to_sym].should eql(10)
      starship.credits.should eql(80)
      Starship.last[field.to_sym].should eql(10)
      Starship.last.credits.should eql(20)
    end
    
    it "buys #{field} as cheap as possible" do
      starship = Factory(:starship, :credits => 100, "buying_#{field}" => 10, "buying_#{field}_price" => 2)
      Factory(:starship, field => 20, "selling_#{field}" => 0, "selling_#{field}_price" => 2)
      Factory(:starship, field => 20, "selling_#{field}" => 0, "selling_#{field}_price" => 1)
      starship.save
      Starship.find(2)[field.to_sym].should eql(20)
      Starship.find(3)[field.to_sym].should eql(10)
    end
  end
end
