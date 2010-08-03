require 'lib/trade'
class Starship < ActiveRecord::Base
  include Trade
  
  attr_protected :arrival_time

  before_validation_on_create :add_name, :add_position, :add_speed
  
  before_update :check_travel_begin
  
  validates_presence_of :name, :x_pos, :y_pos, :speed
  
  validate_on_update :no_position_change_when_travelling
  
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
    starships.delete(self)
    starships
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
  
  def check_travel_begin
    if x_pos_changed? || y_pos_changed?
      self.arrival_time = Time.zone.now +
                      ((x_pos-x_pos_was).abs + (y_pos-y_pos_was).abs) / speed
    end
  end
end
