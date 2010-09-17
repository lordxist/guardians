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

        new_supply += partner.read_attribute(type) - new_partner_supply
        partner.update_attributes(type => new_partner_supply)
      end
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

    def buying?(type)
      buying(type) > read_attribute(type)
    end

    def selling?(type)
      read_attribute(type) > selling(type)
    end

    def method_missing(method_symbol, *args)
      arr = method_symbol.to_s.split('_')
      return buy(arr[1].to_sym) if arr.length.eql?(2) && arr[0].eql?("buy")
      method_missing_without_buy(method_symbol, *args)
    end
  end
end
