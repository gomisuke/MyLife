class UsersController < ApplicationController
	before_action :authenticate_user!

	def show
		@user = current_user
		@diaries = current_user.diaries
		@posts = current_user.posts
		@like_posts = @user.posts
		@life_recodes = LifeRecode.where(user_id: current_user.id)
	end

	def mypage_diary
		@user = current_user
		@diaries = current_user.diaries
	end

	def mypage_post
		@user = current_user
		@posts = current_user.posts
	end

	def mypage_like
		@user = current_user
		@like_posts = @user.like_posts
	end

	def chart_study
		@life_recodes = current_user.life_recodes
	end

	def chart_sleeping
		@life_recodes = current_user.life_recodes
	end

	def chart_exercise
		@life_recodes = current_user.life_recodes
end
