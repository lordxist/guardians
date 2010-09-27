require 'spec_helper'

class Trader
  include Trade

  attr_accessor :durasteel, :credits
  attr_accessor :buying_durasteel_upto, :buying_durasteel_price
  attr_accessor :selling_durasteel_downto, :selling_durasteel_price
  attr_accessor :enable_selling_durasteel

  def initialize
    @durasteel, @credits = 0, 100
    @buying_durasteel_upto, @buying_durasteel_price = 0, 10
    @selling_durasteel_downto, @selling_durasteel_price = 0, 10
    @enable_selling_durasteel = false
  end
end

describe 'Trade', ' included in a ' do
  before(:each) do
    @trader = Trader.new
    @partners = [Trader.new, Trader.new]
    @partners.each do |p|
       p.durasteel = 2
       p.selling_durasteel_downto = 1
       p.enable_selling_durasteel = true
    end
    @trader.stubs(:trade_partners).returns(@partners)
  end
  
  describe Trader do
    it "can buy from its trade partners" do
      @trader.buying_durasteel_upto = 2
      @trader.buy_durasteel
      
      @trader.durasteel.should eql(2)
      @trader.credits.should eql(80)
      @partners.each do |p|
        p.durasteel.should eql(1)
        p.credits.should eql(110)
      end
    end

    it "buys only when cheap enough" do
      @trader.buying_durasteel_upto = 2
      @partners[0].selling_durasteel_price = 20
      @trader.buy_durasteel

      @trader.durasteel.should eql(1)
    end

    it "buys only from the cheapest" do
      @partners << Trader.new
      @partners[2].durasteel = 2
      @partners[2].selling_durasteel_downto = 1
      @partners[2].enable_selling_durasteel = true
      @partners[2].selling_durasteel_price = 10
      @partners[0].selling_durasteel_price = 10
      
      @partners[1].durasteel.should eql(2)
    end
  end
end
