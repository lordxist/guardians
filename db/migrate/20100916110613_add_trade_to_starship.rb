class AddTradeToStarship < ActiveRecord::Migration
  def self.up
    add_column :starships, :durasteel, :integer
    add_column :starships, :buying_durasteel, :integer
    add_column :starships, :buying_durasteel_price, :integer
    add_column :starships, :selling_durasteel, :integer
    add_column :starships, :selling_durasteel_price, :integer
  end

  def self.down
    remove_column :starships, :selling_durasteel_price
    remove_column :starships, :selling_durasteel
    remove_column :starships, :buying_durasteel_price
    remove_column :starships, :buying_durasteel
    remove_column :starships, :durasteel
  end
end
