class AddPricesToPlanet < ActiveRecord::Migration
  def self.up
    add_column :planets, :selling_durasteel_price, :integer, :null => false, :default => 1
    add_column :planets, :selling_plasteel_price, :integer, :null => false, :default => 1
    add_column :planets, :selling_tibanna_price, :integer, :null => false, :default => 1
    
    add_column :planets, :buying_durasteel_price, :integer, :null => false, :default => 1
    add_column :planets, :buying_plasteel_price, :integer, :null => false, :default => 1
    add_column :planets, :buying_tibanna_price, :integer, :null => false, :default => 1
  end

  def self.down
    remove_column :planets, :selling_tibanna_price
    remove_column :planets, :selling_plasteel_price
    remove_column :planets, :selling_durasteel_price
    
    remove_column :planets, :buying_tibanna_price
    remove_column :planets, :buying_plasteel_price
    remove_column :planets, :buying_durasteel_price
  end
end
