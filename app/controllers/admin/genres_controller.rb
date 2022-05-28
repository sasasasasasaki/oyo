class Admin::GenresController < ApplicationController


  def create
      @genre = Genre.new(genre_params)
      @genre.save
      redirect_to admin_genres_path
  end

  def index
    @genres = Genre.all
    @genre = Genre.new
  end

  def edit
    @genre = Genre.find(params[:id])
  end

  def update
    @genre = Genre.find(params[:id])

    if @genre.update(genre_params)
    redirect_to admin_genres_path
    flash[:alert] = "新規登録完了"

    else
      render :edit
    end

  end

private

  def genre_params
    params.require(:genre).permit(:name)
  end
end
