require 'trade'
class Starship < ActiveRecord::Base
  include Trade
  
  acts_as_positioned2d
  
  has_one :travel

  before_create :set_position, :set_supply_and_trade_settings
  before_update :buy_durasteel, :check_if_travel_ended
  
  validates :x_coord, :y_coord, :no_manual_changes => true
  
  alias_method :build_travel_without_defaults, :build_travel
  def build_travel(options = {})
    options.merge!(:x_start => x_coord, :y_start => y_coord)
    build_travel_without_defaults(options)
  end
  
  def starships_on_same_position
    starsystem.starships - [ self ]
  end
  
  def starsystem
    Starsystem.at_coords(x_coord, y_coord)
  end
  
  def trade_partners
    starships_on_same_position
  end
  
  private
  def check_if_travel_ended
    if travel.try(:ended?)
      self.attributes = {
        :x_coord => travel.x_dest,
        :y_coord => travel.y_dest,
      }
      travel.destroy
    end
  end

  def set_position
    (x_coord && y_coord) || self.attributes = {
      :x_coord => 0,
      :y_coord => 0
    }
  end

  def set_supply_and_trade_settings
    self.attributes = {
      :durasteel => 0,
      :buying_durasteel => 0,
      :buying_durasteel_price => 10,
      :selling_durasteel => 0,
      :selling_durasteel_price => 10
    }
  end
end
