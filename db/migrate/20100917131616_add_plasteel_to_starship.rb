class AddPlasteelToStarship < ActiveRecord::Migration
  def self.up
    add_column :starships, :plasteel, :integer
    add_column :starships, :buying_plasteel, :integer
    add_column :starships, :buying_plasteel_price, :integer
    add_column :starships, :selling_plasteel, :integer
    add_column :starships, :selling_plasteel_price, :integer
  end

  def self.down
    remove_column :starships, :selling_plasteel_price
    remove_column :starships, :selling_plasteel
    remove_column :starships, :buying_plasteel_price
    remove_column :starships, :buying_plasteel
    remove_column :starships, :plasteel
  end
end
