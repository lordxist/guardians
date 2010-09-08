class CreateTravels < ActiveRecord::Migration
  def self.up
    create_table :travels do |t|
      t.integer :x_start
      t.integer :y_start
      t.integer :x_dest
      t.integer :y_dest
      t.datetime :arrival_time
      t.integer :starship_id
      
      t.timestamps
    end
  end

  def self.down
    drop_table :travels
  end
end
