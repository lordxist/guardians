module Trade
  def self.included(base)
    base.class_eval do
      alias_method :method_missing_without_buy, :method_missing
      include InstanceMethods
    end
  end

  module InstanceMethods
    def buy(type)
      return unless buying?(type)

      trade_partners.reject! do |partner|
        !partner.selling?(type) ||
          partner.selling_price(type) > buying_price(type)
      end
      trade_partners.sort! {|x, y| x.selling_price(type) <=> y.selling_price(type) }

      new_supply = read_attribute(type)
      for partner in trade_partners
        return unless buying?(type)

        new_partner_supply = partner.read_attribute(type) -
          (buying(type) - new_supply)
        if new_partner_supply < partner.selling(type)
          new_partner_supply = partner.read_attribute(type)
        end
        
        bought = partner.read_attribute(type) - new_partner_supply
        new_supply += bought
        self.credits -= bought * partner.selling_price(type)
        return if self.credits < 0
        new_partner_credits = partner.credits +
          bought * partner.selling_price(type)
        partner.update_attributes(type => new_partner_supply,
          :credits => new_partner_credits)
      end

      self.attributes = {type => new_supply}
    end
    
    def buying(type)
      read_attribute("buying_#{type}")
    end

    def selling(type)
      read_attribute("selling_#{type}")
    end

    def buying_price(type)
      read_attribute("buying_#{type}_price")
    end

    def selling_price(type)
      read_attribute("selling_#{type}_price")
    end

    def buying_amount(type)
      return 0 if buying(type) < read_attribute(type)
      buying(type) - read_attribute(type)
    end

    def selling_amount(type)
      return 0 if selling(type) > read_attribute(type)
      read_attribute(type) - selling(type)
    end

    def buying?(type)
      return false if credits.eql?(0)
      buying(type) > read_attribute(type)
    end

    def selling?(type)
      return false unless selling_enabled?(type)
      read_attribute(type) > selling(type)
    end
    
    def selling_enabled?(type)
      read_attribute("enable_selling_#{type}")
    end
    
    def method_missing(method_symbol, *args)
      arr = method_symbol.to_s.split('_')
      return buy(arr[1].to_sym) if arr.length.eql?(2) && arr[0].eql?("buy")
      method_missing_without_buy(method_symbol, *args)
    end
  end
end
