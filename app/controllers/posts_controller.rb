class PostsController < ApplicationController
  def new
  	@post = Post.new
  end

  def create
  	@post = Post.new(post_params)
  	@post.user = current_user
  	@post.save
  	redirect_to posts_path
  end

  def index
  	@posts = Post.where(user_id: current_user.id)
  end

  def show
  end




  private

  	def post_params
  		params.require(:post).permit(:content, :post_image)
  	end

end
