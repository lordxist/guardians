module Trade
  def self.included(base)
    base.class_eval do
      alias_method :method_missing_without_buy, :method_missing
      include InstanceMethods
    end
  end
  
  module InstanceMethods
    def buy(type)
      for partner in sorted_trade_partners(type)
        price = partner.selling_price(type)
        bought = partner.buy_from(type, affordable_buying_amount(type, price))
        return unless bought > 0
        send("#{type}=", send(type) + bought)
        self.credits -= bought * price

        return unless buying?(type)
      end
    end
    
    def buying_upto(type)
      send("buying_#{type}_upto")
    end

    def selling_downto(type)
      send("selling_#{type}_downto")
    end

    def buying_price(type)
      send("buying_#{type}_price")
    end

    def selling_price(type)
      send("selling_#{type}_price")
    end

    def buying(type)
      return 0 if buying_upto(type) < send(type)
      buying_upto(type) - send(type)
    end
    
    def selling(type)
      return 0 if selling_downto(type) > send(type)
      send(type) - selling_downto(type)
    end

    def buying?(type)
      return false if credits.eql?(0)
      buying_upto(type) > send(type)
    end

    def selling?(type)
      return false unless send("enable_selling_#{type}")
      send(type) > selling_downto(type)
    end
    
    def method_missing(method_symbol, *args)
      arr = method_symbol.to_s.split('_')
      return buy(arr[1].to_sym) if arr.length.eql?(2) && arr[0].eql?("buy")
      method_missing_without_buy(method_symbol, *args)
    end

    protected
    def buy_from(type, buying_amount)
      return 0 unless (bought = bought(type, buying_amount)) > 0
      send("#{type}=", send(type) - bought)
      self.credits += bought * selling_price(type)
      save if method_exists?(:save)
      return bought
    end

    private
    def bought(type, buying_amount)
      return selling(type) if buying_amount > selling(type)
      buying_amount
    end

    def sorted_trade_partners(type)
      return [] unless buying?(type)
      sorted_trade_partners = trade_partners
      sorted_trade_partners.reject! do |partner|
        !partner.selling?(type) ||
          partner.selling_price(type) > buying_price(type)
      end
      sorted_trade_partners.sort! do |x, y|
        x.selling_price(type) <=> y.selling_price(type)
      end
    end

    def affordable_buying_amount(type, price)
      return buying(type) if buying(type) < credits/price
      credits/price > 0 ? credits/price : 0
    end
  end
end
