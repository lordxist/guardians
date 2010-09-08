class Travel < ActiveRecord::Base
  attr_readonly :x_start, :y_start, :x_dest, :y_dest, :speed, :arrival_time
  
  validates_presence_of :x_start, :y_start, :x_dest, :y_dest, :speed
  
  before_create :set_arrival_time
  
  def arrival_in
    Time.zone.at(arrival_time - Time.zone.now)
  end
  
  def destination
    Starsystem.at(x_dest, y_dest)
  end
  
  def ended?
    arrival_time.past?
  end
  
  private
  def set_arrival_time
    self.attributes = attributes.merge!(:arrival_time => 
      Time.zone.now + ((x_dest-x_start).abs + (y_dest-y_start).abs) / speed)
  end
end
