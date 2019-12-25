class Admins::GenresController < ApplicationController
  def index
    @genres = Genre.all
    @newgenre = Genre.new
  end

  def create
    @newgenre = Genre.new(genre_params)
    @newgenre.save
    redirect_to admins_genres_path
  end

  def edit
    @genre = Genre.find(params[:id])
  end

  def update
    @genre = Genre.find(params[:id])
    @genre.update(genre_params)
    redirect_to admins_genres_path
  end

  private
  def genre_params
    params.require(:genre).permit(:genre_name, :genre_status)
  end
end