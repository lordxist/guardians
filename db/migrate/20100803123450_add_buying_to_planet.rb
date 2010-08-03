class AddBuyingToPlanet < ActiveRecord::Migration
  def self.up
    add_column :planets, :buying_durasteel, :integer, :null => false, :default => 0
    add_column :planets, :buying_plasteel, :integer, :null => false, :default => 0
    add_column :planets, :buying_tibanna, :integer, :null => false, :default => 0
  end

  def self.down
    remove_column :planets, :buying_tibanna
    remove_column :planets, :buying_plasteel
    remove_column :planets, :buying_durasteel
  end
end
