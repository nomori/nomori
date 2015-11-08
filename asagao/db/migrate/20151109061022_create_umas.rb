class CreateUmas < ActiveRecord::Migration
  def self.up
    drop_table :umas
    create_table :umas do |t|
	    t.string :horse_name,   null: false

      t.timestamps
    end
  end

  def self.down
    drop_table :umas
  end
end
