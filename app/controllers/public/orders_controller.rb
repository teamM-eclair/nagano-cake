class Public::OrdersController < ApplicationController
  def new
    @order = Order.new
    @customer = Customer.find(current_customer.id)
  end

  def confirm
    @order = Order.new(order_params)
    @order.postcode = current_customer.postcode
    @order.address = current_customer.address
    @order.name = current_customer.first_name + current_cutomer.last_nam
  end
  
  def create
    @order = Order.new(order_params)
    @order.save
    redirect_to confilm_public_orders_path
  end

  def thanx
  end

  def index
  end

  def show
  end
  
  private
  
  def order_params
    params.require(:order).permit(:payment_method, :address, :postcode, :name)
  end
end
