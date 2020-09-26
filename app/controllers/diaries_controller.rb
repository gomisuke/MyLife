class DiariesController < ApplicationController
	before_action :authenticate_user!

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
		@diary_all = current_user.diaries.order(diary_date: "DESC")
		@diaries = current_user.diaries.page(params[:page]).per(3).order(diary_date: "DESC")
	end

	def show
		@diary = Diary.find(params[:id])
	end

	def edit
		@diary = Diary.find(params[:id])
	end

	def update
		@diary = Diary.find(params[:id])
		@diary.update(diary_params)
		redirect_to diary_path(@diary)
	end

	def destroy
		@diary = Diary.find(params[:id])
	end


	def diary_params
		params.require(:diary).permit(:title, :body, :diary_date, :genre_id, :adequacy)
	end
end
