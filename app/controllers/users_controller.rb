class UsersController < ApplicationController



	def show
		@user = User.find(current_user.id)
		@diaries = Diary.where(user_id: current_user)
		@posts = Post.where(user_id: current_user)
		@like_posts = @user.posts
	end

	def mypage_diary
		@user = User.find(current_user.id)
		@diaries = Diary.where(user_id: current_user)
	end

	def mypage_post
		@user = User.find(current_user.id)
		@posts = Post.where(user_id: current_user)
	end

	def mypage_like
		@user = User.find(current_user.id)
		@like_posts = @user.posts
	end
end
