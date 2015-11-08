class LessonController < ApplicationController
	def step1
		render text: "Hello,{params[:name]}"
	end
end
