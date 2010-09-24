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

      new_supply = send(type)
      for partner in trade_partners
        return unless buying?(type)

        new_partner_supply = partner.send(type) -
          (buying(type) - new_supply)
        if new_partner_supply < partner.selling(type)
          new_partner_supply = partner.send(type)
        end
        
        bought = partner.send(type) - new_partner_supply
        new_supply += bought
        self.credits -= bought * partner.selling_price(type)
        return if self.credits < 0
        new_partner_credits = partner.credits +
          bought * partner.selling_price(type)
        partner.send("#{type}=", new_partner_supply)
        partner.credits = new_partner_credits
        partner.save if partner.method_exists?(:save)
      end

      self.send("#{type}=", new_supply)
    end
    
    def buying(type)
      send("buying_#{type}")
    end

    def selling(type)
      send("selling_#{type}")
    end

    def buying_price(type)
      send("buying_#{type}_price")
    end

    def selling_price(type)
      send("selling_#{type}_price")
    end

    def buying_amount(type)
      return 0 if buying(type) < send(type)
      buying(type) - send(type)
    end

    def selling_amount(type)
      return 0 if selling(type) > send(type)
      send(type) - selling(type)
    end

    def buying?(type)
      return false if credits.eql?(0)
      buying(type) > send(type)
    end

    def selling?(type)
      return false unless selling_enabled?(type)
      send(type) > selling(type)
    end
    
    def selling_enabled?(type)
      send("enable_selling_#{type}")
    end
    
    def method_missing(method_symbol, *args)
      arr = method_symbol.to_s.split('_')
      return buy(arr[1].to_sym) if arr.length.eql?(2) && arr[0].eql?("buy")
      method_missing_without_buy(method_symbol, *args)
    end
  end
end
