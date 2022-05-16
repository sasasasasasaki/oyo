class Admin::GenresController < ApplicationController


  def create
      @genre = Genre.new
      @genre.save
      redirect_to admin_genres_path
  end
    
  def index
  end
  
  def edit
  end
  
    private
    
  def genre_params
    params.require(:genre).permit(:name)
  end
end
