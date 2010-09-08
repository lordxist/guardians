class Starship < ActiveRecord::Base
  acts_as_positioned2d
  
  has_one :travel
  
  validates_presence_of :name, :x_pos, :y_pos
  
  before_update :check_travel
  
  def starsystem
    Starsystem.at(x_pos, y_pos)
  end
  
  def starships_on_same_position
    starsystem.starships - [self]
  end
  
  def update_related_game_objects
    starsystem.starships.each { |s| s.save }
  end
  
  private
  def check_travel
    create_travel(
      :x_start => x_pos_was,
      :y_start => y_pos_was,
      :x_dest => x_pos,
      :y_dest => y_pos,
      :speed => speed
    ) if x_pos_changed? || y_pos_changed?
    
    if travel && travel.ended?
      travel.destroy
      reload
    end
  end
end
