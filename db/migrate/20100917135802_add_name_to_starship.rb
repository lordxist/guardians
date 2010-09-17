class AddNameToStarship < ActiveRecord::Migration
  def self.up
    add_column :starships, :name, :string
  end

  def self.down
    remove_column :starships, :name
  end
end
