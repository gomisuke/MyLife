class GenresController < ApplicationController
  before_action :authenticate_user!

  def index
  	@genre = Genre.new
  	@genres = current_user.genres
  end

  def create
  	@genre = Genre.new(genre_params)
  	@genre.user = current_user
  	if @genre.save
      flash[:success] = "新しいジャンルを作成しました"
      redirect_to genres_path
    else
      render 'index'
    end
  end

  def destroy
  	@genre = Genre.find(params[:id])
  	if @genre.destroy
      flash[:danger] = "ジャンルを削除しました"
      redirect_to genres_path
    else
      render 'index'
    end
  end


  private

  	def genre_params
  		params.require(:genre).permit(:name)
  	end
end
