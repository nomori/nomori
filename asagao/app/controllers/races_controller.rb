class RacesController < ApplicationController
	def index
		@races = Race.order("race_name")
	end
	
	def show
		redirect_to action: "index"
	end
	
	def new
		@race = Race.new()
	end
	
	def edit
		@race = Race.find(params[:id])
	end
	
	def create
		@reqParam = params[:race]
		@raceFind = Race.find_by_race_name(@reqParam[:race_name])
		
		if @raceFind.present? 
			@race = Race.new()
			flash.now[:alert] = "登録済みです。"
			render action: "new"
		else	
			@race = Race.new(params[:race])
		
			if @race.save
				redirect_to @race, notice: "登録しました。"
			else
				render "new"
			end
		end
	end	
	
	def update
	end
	
	def destroy
		@race = Race.find(params[:id])
		@race.destroy

		redirect_to @race, notice: "削除しました。"
	end
end
