class Admin::HomesController < ApplicationController
  before_action :authenticate_admin!
  
  def top
    @orders = Order.all
    @order_pages = Order.page(params[:page]).per(10).order(:id)
  end
end
