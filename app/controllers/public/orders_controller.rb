class Public::OrdersController < ApplicationController
  def new
    @order = Order.new
    @deliveries = Delivery.all
  end

  def confirm
  end
  
  def create
  end

  def thanx
  end

  def index
  end

  def show
  end
end
