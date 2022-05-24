class Admin::HomesController < ApplicationController
  def top
    @orders = Order.all
    @order_pages = Order.page(params[:page]).per(10).order(:id)
  end
end
