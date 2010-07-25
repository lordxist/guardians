class Starship < ActiveRecord::Base
  before_validation_on_create :add_name, :add_position
  
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
end
