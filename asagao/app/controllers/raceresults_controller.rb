class RaceresultsController < ApplicationController
	def index
		@raceresults = Raceresult.order("race_id")
	end
	
	def show
		redirect_to action: "index"
	end
	
	def new
		@uma = Uma.order("horse_name")
		@race = Race.order("race_name")
		@raceresult = Raceresult.new()
	end
	
	def edit
		@raceresult = Raceresult.find(params[:id])
	end
	
	def create
			@raceresult = Raceresult.new(params[:raceresult])
		
			if @raceresult.save
				redirect_to @raceresult, notice: "登録しました。"
			else
				render "new"
			end
	end	
	
	def update
		redirect_to action: "index"
	end
	
	def destroy
		@raceresult = Raceresult.find(params[:id])
		@raceresult.destroy

		redirect_to @raceresult, notice: "削除しました。"
	end
end
