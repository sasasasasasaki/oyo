class Admin::ItemsController < ApplicationController

  def create
    @item = Item.new(item_params)
    @item.save
    redirect_to admin_item_path(@item.id)
  end

  def index
    @item = Item.new
    @items = Item.all.page(params[:page]).per(5)

  end

  def new
    @item = Item.new
    @genres = Genre.all

  end



  def show
    @item = Item.find(params[:id])
  end

  def edit
    @genres = Genre.all
    @item = Item.find(params[:id])
  end

  def update
    @genres = Genre.all
    @item = Item.find(params[:id])

    if @item.update(item_params)
    redirect_to admin_item_path(@item.id)
    flash[:alert] = "編集完了"

    else
      render :edit
    end
  end

private

  def item_params
    params.require(:item).permit(:name,:introduction,:image,:price,:genre_id,:page, :is_active)
  end
end