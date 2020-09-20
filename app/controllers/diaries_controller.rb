class DiariesController < ApplicationController

	def new
		@diary = Diary.new
	end

	def create
		@diary = Diary.new(diary_params)
		@diary.user = current_user
		if @diary.save
			flash[:success] = "日記を作成しました！"
			redirect_to customs_path
		else
			render 'new'
		end
	end

	def index
		@diary_all = Diary.where(user_id: current_user.id).order(diary_date: "DESC")
		@diaries = Diary.where(user_id: current_user.id).page(params[:page]).per(3).order(diary_date: "DESC")
	end

	def show
		@diary = Diary.find(params[:id])
	end

	def edit
	end

	def update
	end


	def diary_params
		params.require(:diary).permit(:title, :body, :diary_date, :genre_id, :adequacy)
	end
end
