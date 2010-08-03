require File.expand_path(File.join(File.dirname(__FILE__),'comparison_macros'))

def it_trades_correctly(model)
  [:credits, :durasteel, :plasteel, :tibanna].each do |field|
    it "'s #{field} is/are always at least zero" do
      always_at_least_zero(:starship, field)
    end
  end

  ["durasteel", "plasteel", "tibanna"].each do |field|    
    ["selling", "buying"].each do |prefix|
      it "'s #{prefix}_#{field} is/are always at least zero" do
        always_at_least_zero(model, (prefix+"_"+field).to_sym)
      end
      
      it "'s #{prefix}_#{field}_price is always greater than zero" do
        always_greater_than_zero(model, (prefix+"_"+field+"_price").to_sym)
      end
    end
    
    it "'s never buying and selling #{field} at the same time" do
      obj = Factory(model.to_sym, "buying_#{field}" => 300)
      obj.attributes = {"selling_#{field}" => 300}
      obj.should_not be_valid
    end
    
    it "buys #{field} correctly if set to do so" do
      obj = Factory(model.to_sym, :credits => 100, "buying_#{field}" => 10, "buying_#{field}_price" => 2)
      Factory(:starship, field => 20, "selling_#{field}" => 0, "selling_#{field}_price" => 2)
      obj.save
      obj[field.to_sym].should eql(10)
      obj.credits.should eql(80)
      Starship.last[field.to_sym].should eql(10)
      Starship.last.credits.should eql(20)
    end
    
    it "buys #{field} as cheap as possible" do
      obj = Factory(model.to_sym, :credits => 100, "buying_#{field}" => 10, "buying_#{field}_price" => 2)
      Factory(:starship, field => 20, "selling_#{field}" => 0, "selling_#{field}_price" => 2)
      Factory(:starship, field => 20, "selling_#{field}" => 0, "selling_#{field}_price" => 1)
      obj.save
      obj.is_a?(Starship) ? id = 2 : id = 1
      Starship.find(id)[field.to_sym].should eql(20)
      Starship.find(id+1)[field.to_sym].should eql(10)
    end
  end
end
