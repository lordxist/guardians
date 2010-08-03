class AddSellingToPlanet < ActiveRecord::Migration
  def self.up
    add_column :planets, :selling_durasteel, :integer, :null => false, :default => 0
    add_column :planets, :selling_plasteel, :integer, :null => false, :default => 0
    add_column :planets, :selling_tibanna, :integer, :null => false, :default => 0
  end

  def self.down
    remove_column :planets, :selling_tibanna
    remove_column :planets, :selling_plasteel
    remove_column :planets, :selling_durasteel
  end
end
