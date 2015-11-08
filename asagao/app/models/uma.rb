class Uma < ActiveRecord::Base
  has_many :raceresults
  has_many :races, through: :raceresults  
end
