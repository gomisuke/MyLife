class DiariesController < ApplicationController

	def new
		@diary = Diary.new
	end

	def create
		@diary = Diary.new(diary_params)
		@diary.user = current_user
		@diary.save
		redirect_to customs_path
	end

	def index
		@diaries = Diary.where(user_id: current_user.id)
	end

	def edit
	end

	def update
	end


	def diary_params
		params.require(:diary).permit(:title, :body, :diary_date, :genre_id, :adequacy)
	end
end
