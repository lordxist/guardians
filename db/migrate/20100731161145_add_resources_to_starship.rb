class AddResourcesToStarship < ActiveRecord::Migration
  def self.up
    add_column :starships, :credits, :integer, :null => false, :default => 0
    add_column :starships, :durasteel, :integer, :null => false, :default => 0
    add_column :starships, :plasteel, :integer, :null => false, :default => 0
    add_column :starships, :tibanna, :integer, :null => false, :default => 0
  end

  def self.down
    remove_column :starships, :tibanna
    remove_column :starships, :plasteel
    remove_column :starships, :durasteel
    remove_column :starships, :credits
  end
end
