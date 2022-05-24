class Admin::ItemsController < ApplicationController
  def index
    @items = Item.all
  end

  def new
  end

  def create
  end

  def show
    @item = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
    if @item.update(item.params)
      redirect_to admin_item_path
    end
  end
end
