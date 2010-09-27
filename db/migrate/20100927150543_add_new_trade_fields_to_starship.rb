class AddNewTradeFieldsToStarship < ActiveRecord::Migration
  def self.up
    add_column :starships, :buying_durasteel_upto, :integer
    add_column :starships, :selling_durasteel_downto, :integer
    add_column :starships, :buying_plasteel_upto, :integer
    add_column :starships, :selling_plasteel_downto, :integer
    add_column :starships, :buying_tibanna_upto, :integer
    add_column :starships, :selling_tibanna_downto, :integer
  end

  def self.down
    remove_column :starships, :selling_tibanna_downto
    remove_column :starships, :buying_tibanna_upto
    remove_column :starships, :selling_plasteel_downto
    remove_column :starships, :buying_plasteel_upto
    remove_column :starships, :selling_durasteel_downto
    remove_column :starships, :buying_durasteel_upto
  end
end
