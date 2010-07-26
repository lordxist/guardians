class AddArrivalTimeToStarship < ActiveRecord::Migration
  def self.up
    add_column :starships, :arrival_time, :datetime
  end

  def self.down
    remove_column :starships, :arrival_time
  end
end
