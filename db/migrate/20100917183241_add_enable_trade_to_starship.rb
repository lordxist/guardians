class AddEnableTradeToStarship < ActiveRecord::Migration
  def self.up
    add_column :starships, :enable_selling_durasteel, :boolean
    add_column :starships, :enable_selling_plasteel, :boolean
    add_column :starships, :enable_selling_tibanna, :boolean
  end

  def self.down
    remove_column :starships, :enable_selling_tibanna
    remove_column :starships, :enable_selling_plasteel
    remove_column :starships, :enable_selling_durasteel
  end
end
