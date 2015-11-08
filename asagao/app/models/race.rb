class Race < ActiveRecord::Base
  has_many :raceresults
  has_many :umas, through: :raceresults  
end
