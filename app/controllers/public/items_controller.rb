class Public::ItemsController < ApplicationController
  def index
    @items = Item.all
    @item_pages = Item.page(params[:page]).per(8).order(:id)
  end

  def show
    @item = Item.find(params[:id])
    @cart_item = CartItem.new
  end
end
