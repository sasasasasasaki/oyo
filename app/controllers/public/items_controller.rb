class Public::ItemsController < ApplicationController

  def show
    @item = Item.find(params[:id])
    @cart_item = CartItem.new
  end

  def index
    @item = Item.new
    @items = Item.all
    @page = Item.all.page(params[:page]).per(5)
  end

  private

  def item_params
    params.require(:item).permit(:image,:genre_id, :price, :name ,:introduction, :is_active, :page)
  end

end
