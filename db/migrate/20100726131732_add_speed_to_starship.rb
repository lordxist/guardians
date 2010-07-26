class AddSpeedToStarship < ActiveRecord::Migration
  def self.up
    add_column :starships, :speed, :integer
  end

  def self.down
    remove_column :starships, :speed
  end
end
