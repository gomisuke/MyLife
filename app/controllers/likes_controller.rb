class LikesController < ApplicationController
	before_action :authenticate_user!

	def create
		@post = Post.find(params[:post_id])
		@like = Like.new
		@like.user = current_user
		@like.post = @post
		@like.save
	end

	def destroy
		@post = Post.find(params[:post_id])
		@like = Like.find_by(post_id: @post.id, user_id: params[:id])
		@like.destroy
	end
end
