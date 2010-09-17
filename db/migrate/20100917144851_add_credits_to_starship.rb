class AddCreditsToStarship < ActiveRecord::Migration
  def self.up
    add_column :starships, :credits, :integer
  end

  def self.down
    remove_column :starships, :credits
  end
end
