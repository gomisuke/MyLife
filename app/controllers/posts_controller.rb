class PostsController < ApplicationController
  before_action :authenticate_user!

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
      @posts = tag.posts.where(post_status: true).page(params[:page]).per(12).order(created_at: "DESC")
    else
  	  @posts = Post.where(post_status: true).page(params[:page]).per(12).order(created_at: "DESC")
    end

    if params[:search]
      @tags = Tag.search(params[:search])
    else
      @tags = Tag.all
    end
  end

  def show
    @post = Post.find(params[:id])
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to posts_path
  end

  def post_search
    @tags = Tag.all
    @posts = Post.search(params[:post_search])
    @search_word = params[:post_search]
  end

  private

  	def post_params
  		params.require(:post).permit(:content, :post_image, :post_status)
  	end

end
