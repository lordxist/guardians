class Starship < ActiveRecord::Base
  attr_protected :arrival_time

  before_validation_on_create :add_name, :add_position, :add_speed
  
  before_update :check_travel_begin, :conduct_trade
  
  [:credits, :durasteel, :plasteel, :tibanna].each do |field|
    validates_numericality_of field, :only_integer => true, :greater_than_or_equal_to => 0
  end
  ["durasteel", "plasteel", "tibanna"].each do |field|
    ["selling", "buying"].each do |prefix|
      validates_numericality_of(prefix+"_"+field, :only_integer => true, :greater_than_or_equal_to => 0)
      validates_numericality_of(prefix+"_"+field+"_price", :only_integer => true, :greater_than => 0)
    end
  end
  validates_presence_of :name, :x_pos, :y_pos, :speed
  with_options :if => "errors.empty?" do |starship|
    starship.validate_on_update :no_position_change_when_travelling
    starship.validate :no_buying_while_selling
  end
  
  def arrival_in
    if travelling?
      Time.zone.at(arrival_time - Time.zone.now)
    end
  end
  
  def no_position_change_when_travelling
    if travelling?
      errors.add(:x_pos, "musn't change when travelling") if x_pos_changed?
      errors.add(:y_pos, "musn't change when travelling") if y_pos_changed?
    end
  end
  
  def planet_on_same_position
    unless travelling?
      Planet.find_by_x_pos_and_y_pos(x_pos, y_pos)
    end
  end
  
  def position
    x_pos.to_s + "," + y_pos.to_s
  end
  
  def starships_on_same_position
    starships = []
    starships = Starship.find_all_by_x_pos_and_y_pos(x_pos, y_pos) unless travelling?
    starships - [self]
  end
  
  def travelling?
    arrival_time.try(:future?)
  end
  
  private
  def add_name
    self.name = "Humbarine's Pride"
  end
  
  def add_position
    self.x_pos = 0 unless x_pos
    self.y_pos = 0 unless y_pos
  end
  
  def add_speed
    self.speed = 1
  end
  
  def no_buying_while_selling
    errors.add(:buying_durasteel, "not allowed while selling") if selling_durasteel > 0 && buying_durasteel > 0
    errors.add(:buying_plasteel, "not allowed while selling") if selling_plasteel > 0 && buying_plasteel > 0
    errors.add(:buying_tibanna, "not allowed while selling") if selling_tibanna > 0 && buying_tibanna > 0
  end

  def check_travel_begin
    if x_pos_changed? || y_pos_changed?
      self.arrival_time = Time.zone.now +
                      ((x_pos-x_pos_was).abs + (y_pos-y_pos_was).abs) / speed
    end
  end
  
  def conduct_trade
    ["durasteel", "plasteel", "tibanna"].each do |res|
      for starship in starships_on_same_position.sort_by {|s| s["selling_#{res}_price"] }
        if starship["selling_#{res}_price"] <= self["buying_#{res}_price"] &&
            self["buying_#{res}".to_sym] > self["#{res}"] && starship["#{res}"] > starship["selling_#{res}"]
          bought = starship["#{res}"] - starship["selling_#{res}"]
          if starship["#{res}"] - starship["selling_#{res}"] >= self["buying_#{res}"] - self["#{res}"]
            bought = self["buying_#{res}"] - self["#{res}"]
          end
          starship.update_attributes(
            res => starship["#{res}"] - bought,
            :credits => starship.credits + bought * starship["selling_#{res}_price"]
          )
          self.attributes = {
            res => self["#{res}"] + bought,
            :credits => credits - bought * starship["selling_#{res}_price"]
          }
        end
      end
    end
  end
end
