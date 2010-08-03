class AddSellingToStarship < ActiveRecord::Migration
  def self.up
    add_column :starships, :selling_durasteel, :integer, :null => false, :default => 0
    add_column :starships, :selling_plasteel, :integer, :null => false, :default => 0
    add_column :starships, :selling_tibanna, :integer, :null => false, :default => 0
  end

  def self.down
    remove_column :starships, :selling_tibanna
    remove_column :starships, :selling_plasteel
    remove_column :starships, :selling_durasteel
  end
end
