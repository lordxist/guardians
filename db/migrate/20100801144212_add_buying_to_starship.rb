class AddBuyingToStarship < ActiveRecord::Migration
  def self.up
    add_column :starships, :buying_durasteel, :integer, :null => false, :default => 0
    add_column :starships, :buying_plasteel, :integer, :null => false, :default => 0
    add_column :starships, :buying_tibanna, :integer, :null => false, :default => 0
  end

  def self.down
    remove_column :starships, :buying_tibanna
    remove_column :starships, :buying_plasteel
    remove_column :starships, :buying_durasteel
  end
end
