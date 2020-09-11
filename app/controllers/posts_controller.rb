class PostsController < ApplicationController
  def new
  	@post = Post.new
  end

  def create
  	@post = Post.new(post_params)
  	@post.user = current_user
    tag_list = params[:post][:tag_name].split
    if @post.save
      @post.save_tag(tag_list)
      redirect_to posts_path
    else
      render 'new'
    end
  end

  def index
  	@posts = Post.all
    @tags = Tag.all
  end

  def show
    
  end




  private

  	def post_params
  		params.require(:post).permit(:content, :post_image)
  	end

end
