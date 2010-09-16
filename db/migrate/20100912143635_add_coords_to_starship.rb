class AddCoordsToStarship < ActiveRecord::Migration
  def self.up
    add_column :starships, :x_coord, :integer
    add_column :starships, :y_coord, :integer
  end

  def self.down
    remove_column :starships, :y_coord
    remove_column :starships, :x_coord
  end
end
