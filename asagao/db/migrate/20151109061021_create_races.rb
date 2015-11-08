class CreateRaces < ActiveRecord::Migration
  def self.up
    drop_table :races
    create_table :races do |t|
	    t.string :race_name,   null: false
       
      t.timestamps
    end
  end

  def self.down
    drop_table :races
  end
end
