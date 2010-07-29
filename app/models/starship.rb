class Starship < ActiveRecord::Base
  attr_protected :arrival_time

  before_validation_on_create :add_name, :add_position, :add_speed
  
  before_update :check_travel_begin
  
  validates_presence_of :name, :x_pos, :y_pos, :speed
  
  def arrival_in
    if arrival_time.try(:future?)
      Time.zone.at(arrival_time - Time.zone.now)
    end
  end
  
  def position
    x_pos.to_s + "," + y_pos.to_s
  end
  
  private
  def add_name
    self.name = "Humbarine's Pride"
  end
  
  def add_position
    self.attributes = {:x_pos => 0, :y_pos => 0}
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
