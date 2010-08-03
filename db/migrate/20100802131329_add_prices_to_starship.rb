class AddPricesToStarship < ActiveRecord::Migration
  def self.up
    add_column :starships, :selling_durasteel_price, :integer, :null => false, :default => 1
    add_column :starships, :selling_plasteel_price, :integer, :null => false, :default => 1
    add_column :starships, :selling_tibanna_price, :integer, :null => false, :default => 1
    
    add_column :starships, :buying_durasteel_price, :integer, :null => false, :default => 1
    add_column :starships, :buying_plasteel_price, :integer, :null => false, :default => 1
    add_column :starships, :buying_tibanna_price, :integer, :null => false, :default => 1
  end

  def self.down
    remove_column :starships, :selling_tibanna_price
    remove_column :starships, :selling_plasteel_price
    remove_column :starships, :selling_durasteel_price
    
    remove_column :starships, :buying_tibanna_price
    remove_column :starships, :buying_plasteel_price
    remove_column :starships, :buying_durasteel_price
  end
end
