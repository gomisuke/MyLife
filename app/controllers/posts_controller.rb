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
      flash[:success] = "投稿しました"
      redirect_to posts_path
    else
      render 'new'
    end
  end

  def index
    if params[:tag_search]
      tag = Tag.find(params[:tag_search])
      @posts = tag.posts
    else
  	  @posts = Post.all
    end

    if params[:search]
      @tags = Tag.search(params[:search])
    else
      @tags = Tag.all
    end
  end

  def show
    
  end




  private

  	def post_params
  		params.require(:post).permit(:content, :post_image)
  	end

end
