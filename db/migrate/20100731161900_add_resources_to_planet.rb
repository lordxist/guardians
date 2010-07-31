class AddResourcesToPlanet < ActiveRecord::Migration
  def self.up
    add_column :planets, :credits, :integer, :null => false, :default => 0
    add_column :planets, :durasteel, :integer, :null => false, :default => 0
    add_column :planets, :plasteel, :integer, :null => false, :default => 0
    add_column :planets, :tibanna, :integer, :null => false, :default => 0
  end

  def self.down
    remove_column :planets, :tibanna
    remove_column :planets, :plasteel
    remove_column :planets, :durasteel
    remove_column :planets, :credits
  end
end
