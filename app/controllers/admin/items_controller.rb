class Admin::ItemsController < ApplicationController
  before_action :authenticate_admin!
  
  def index
    @items = Item.page(params[:page])
  end

  def new
    @item = Item.new
    @genres = Genre.all
  end

  def create
     @item = Item.new(item_params)
    if @item.save
      flash[:success] = "新商品を登録しました"
      redirect_to admin_item_path(@item)
    else
      render :new
    end
  end

  def show
    @item = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
    @genre = Genre.all
  end

  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
      redirect_to admin_item_path
    else
      render "edit"
    end
  end

  private

  def item_params
    params.require(:item).permit(:name, :detail, :genre_id, :unit_price, :sales_status, :image )
  end
end
