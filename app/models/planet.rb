class Planet < ActiveRecord::Base
  before_validation_on_create :add_name, :add_position
  
  validate_on_update :no_name_change, :no_position_change
  
  private
  def add_name
    self.name = "Incognita I"
  end
  
  def add_position
    self.x_pos = 0 unless x_pos
    self.y_pos = 0 unless y_pos
  end
  
  def no_name_change
    errors.add(:name, "must not change") unless name.eql?(name_was)
  end
  
  def no_position_change
    errors.add(:x_pos, "must not change") unless x_pos.eql?(x_pos_was)
    errors.add(:y_pos, "must not change") unless y_pos.eql?(y_pos_was)
  end
end
