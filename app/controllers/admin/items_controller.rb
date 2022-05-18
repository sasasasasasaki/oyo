class Admin::ItemsController < ApplicationController
  def index
  end

  def new
    @item = Item.new
    @genres = Genre.all

  end
  
  def create
    @item = Item.new(item_params)
    @item.save
    redirect_to new_admin_item_path
  end

  def show
  end

  def edit
  end


private

  def genre_params
    params.require(:item).permit(:name,:introduction,:image,:name,:price,:genre_id)
  end
end