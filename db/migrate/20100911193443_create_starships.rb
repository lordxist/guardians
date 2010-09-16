class CreateStarships < ActiveRecord::Migration
  def self.up
    create_table :starships do |t|
      t.integer :user_id

      t.timestamps
    end
  end

  def self.down
    drop_table :starships
  end
end
