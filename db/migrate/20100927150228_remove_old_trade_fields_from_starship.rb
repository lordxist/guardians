class RemoveOldTradeFieldsFromStarship < ActiveRecord::Migration
  def self.up
    remove_column :starships, :buying_durasteel
    remove_column :starships, :selling_durasteel
    remove_column :starships, :buying_plasteel
    remove_column :starships, :selling_plasteel
    remove_column :starships, :buying_tibanna
    remove_column :starships, :selling_tibanna
  end

  def self.down
    add_column :starships, :selling_tibanna, :integer
    add_column :starships, :buying_tibanna, :integer
    add_column :starships, :selling_plasteel, :integer
    add_column :starships, :buying_plasteel, :integer
    add_column :starships, :selling_durasteel, :integer
    add_column :starships, :buying_durasteel, :integer
  end
end
