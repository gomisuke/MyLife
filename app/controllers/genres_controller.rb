class GenresController < ApplicationController
  def index
  	@genre = Genre.new
  	@genres = Genre.where(user_id: current_user.id)
  end

  def create
  	@genre = Genre.new(genre_params)
  	@genre.user = current_user
  	@genre.save
  	redirect_to genres_path
  end

  def destroy
  	@genre = Genre.find(params[:id])
  	@genre.destroy
  	redirect_to genres_path
  end


  private

  	def genre_params
  		params.require(:genre).permit(:name)
  	end
end
