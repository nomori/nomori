class UmasController < ApplicationController
	def index
		@umas = Uma.order("horse_name")
	end
	
	def show
		redirect_to action: "index"
	end
	
	def new
		@uma = Uma.new()
	end
	
	def edit
		@uma = Uma.find(params[:id])
	end
	
	def create
		@reqParam = params[:uma]
		@umaFind = Uma.find_by_horse_name(@reqParam[:horse_name])
		
		if @umaFind.present? 
			@uma = Uma.new()
			flash.now[:alert] = "登録済みです。"
			render action: "new"
		else	
			@uma = Uma.new(params[:uma])
		
			if @uma.save
				redirect_to @uma, notice: "登録しました。"
			else
				render "new"
			end
		end
	end	
	
	def update
	end
	
	def destroy
		@uma = Uma.find(params[:id])
		@uma.destroy

		redirect_to @uma, notice: "削除しました。"
	end
end
