class AddStartToTravel < ActiveRecord::Migration
  def self.up
    add_column :travels, :x_start, :integer
    add_column :travels, :y_start, :integer
  end

  def self.down
    remove_column :travels, :y_start
    remove_column :travels, :x_start
  end
end
