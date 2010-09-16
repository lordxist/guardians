class RemoveCoordsFromTravel < ActiveRecord::Migration
  def self.up
    remove_column :travels, :x_coord
    remove_column :travels, :y_coord
  end

  def self.down
    add_column :travels, :y_coord, :integer
    add_column :travels, :x_coord, :integer
  end
end
