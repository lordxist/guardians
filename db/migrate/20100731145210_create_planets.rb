class CreatePlanets < ActiveRecord::Migration
  def self.up
    create_table :planets do |t|
      t.string :name
      t.integer :x_pos
      t.integer :y_pos

      t.timestamps
    end
  end

  def self.down
    drop_table :planets
  end
end
