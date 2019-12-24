class Admins::GenresController < ApplicationController
  def index
    @genres = Genre.all
    @newgenre = Genre.new
  end

  def create
  end

  def edit
  end

  def update
  end

  private
  def genre_params
    params.require(:genre).permit(:genre_name, :genre_status)
  end
end
