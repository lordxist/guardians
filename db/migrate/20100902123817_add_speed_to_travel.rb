class AddSpeedToTravel < ActiveRecord::Migration
  def self.up
    add_column :travels, :speed, :integer
  end

  def self.down
    remove_column :travels, :speed
  end
end
