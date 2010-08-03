module Trade
  def self.included(base)
    base.class_eval do
      before_update :conduct_trade

      [:credits, :durasteel, :plasteel, :tibanna].each do |field|
        validates_numericality_of field, :only_integer => true, :greater_than_or_equal_to => 0
      end
      ["durasteel", "plasteel", "tibanna"].each do |field|
        ["selling", "buying"].each do |prefix|
          validates_numericality_of(prefix+"_"+field, :only_integer => true, :greater_than_or_equal_to => 0)
          validates_numericality_of(prefix+"_"+field+"_price", :only_integer => true, :greater_than => 0)
        end
      end
      
      validate :no_buying_while_selling, :if => "errors.empty?"
    end
  end
  
  private
  def no_buying_while_selling
    errors.add(:buying_durasteel, "not allowed while selling") if selling_durasteel > 0 && buying_durasteel > 0
    errors.add(:buying_plasteel, "not allowed while selling") if selling_plasteel > 0 && buying_plasteel > 0
    errors.add(:buying_tibanna, "not allowed while selling") if selling_tibanna > 0 && buying_tibanna > 0
  end
  
  def conduct_trade
    ["durasteel", "plasteel", "tibanna"].each do |res|
      trade_partners = starships_on_same_position
      unless is_a?(Planet) || !(planet = planet_on_same_position)
        trade_partners << planet
      end
      trade_partners = trade_partners.sort_by {|p| p["selling_#{res}_price"] }
      for trade_partner in trade_partners
        if trade_partner["selling_#{res}_price"] <= self["buying_#{res}_price"] &&
            self["buying_#{res}".to_sym] > self["#{res}"] &&
            trade_partner["#{res}"] > trade_partner["selling_#{res}"]
          bought = trade_partner["#{res}"] - trade_partner["selling_#{res}"]
          if trade_partner["#{res}"] - trade_partner["selling_#{res}"] >= self["buying_#{res}"] - self["#{res}"]
            bought = self["buying_#{res}"] - self["#{res}"]
          end
          trade_partner.update_attributes(
            res => trade_partner["#{res}"] - bought,
            :credits => trade_partner.credits + bought * trade_partner["selling_#{res}_price"]
          )
          self.attributes = {
            res => self["#{res}"] + bought,
            :credits => credits - bought * trade_partner["selling_#{res}_price"]
          }
        end
      end
    end
  end
end
