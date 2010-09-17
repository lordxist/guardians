class AddTibannaToStarship < ActiveRecord::Migration
  def self.up
    add_column :starships, :tibanna, :integer
    add_column :starships, :buying_tibanna, :integer
    add_column :starships, :buying_tibanna_price, :integer
    add_column :starships, :selling_tibanna, :integer
    add_column :starships, :selling_tibanna_price, :integer
  end

  def self.down
    remove_column :starships, :selling_tibanna_price
    remove_column :starships, :selling_tibanna
    remove_column :starships, :buying_tibanna_price
    remove_column :starships, :buying_tibanna
    remove_column :starships, :tibanna
  end
end
