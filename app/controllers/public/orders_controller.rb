class Public::OrdersController < ApplicationController
  def new
    @order = Order.new
    @customer = Customer.find(current_customer.id)
    @delivery = Delivery.all #find(current_customer.id)
  end

  def confirm
    @order = Order.new(order_params)
    @order.postcode = current_customer.postcode
    @order.address = current_customer.address
    @order.name = current_customer.first_name + current_cutomer.last_name
    bindinr.pry
    @cart_items = CartItem.all
    @price = item.unit_price * item.amount    
  end

  def create
    @order = Order.new(order_params)
    @order.save
    redirect_to thanx_public_orders_path
  end

  def thanx
  end

  def index
    @orders = Order.all
    @order = Order.new
  end

  def show
    @order = Order.find(params[:id])
    @customer = current_customer
  end

  private

  def order_params
    params.require(:order).permit(:payment_method, :address, :postcode, :name)
  end
end
