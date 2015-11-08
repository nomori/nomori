class CreateRaceresults < ActiveRecord::Migration
  def self.up
    drop_table :raceresults
    create_table :raceresults do |t|
	     t.references  :race,   null: false
	     t.references  :uma,  null: false
       t.datetime :race_date,    null: false
       t.integer :race_result,    null: false

       t.timestamps
    end
  end

  def self.down
    drop_table :raceresults
  end
end
