class Travel < ActiveRecord::Base
  attr_readonly :x_start, :y_start, :x_dest, :y_dest, :starship_id
  
  validates :x_start, :y_start, :x_dest, :y_dest, :starship_id, :presence => true
  
  def arrival_in
    Time.zone.at(arrival_time - Time.zone.now)
  end

  def arrival_time
    created_at + DistanceCalc.unidim_dist_sum(x_start, y_start, x_dest, y_dest)
  end
  
  def destination
    Starsystem.at_coords(x_dest, y_dest)
  end

  def ended?
    arrival_time.past?
  end
end
