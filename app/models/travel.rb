require 'core_ext/point2d'
class Travel < ActiveRecord::Base
  attr_readonly :x_start, :y_start, :x_dest, :y_dest, :starship_id
  
  validates :x_start, :y_start, :x_dest, :y_dest, :starship_id, :presence => true
  
  def arrival_in
    Time.zone.at(arrival_time - Time.zone.now)
  end

  def arrival_time
    created_at +
      Point2D.new(x_start, y_start).unidimensional_distances_sum(x_dest, y_dest)
  end

  def destination
    Starsystem.at_coords(x_dest, y_dest)
  end

  def ended?
    arrival_time.past?
  end
end
