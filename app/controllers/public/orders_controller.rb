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
    redirect_to confirm_public_orders
  end

  def thanx
  end

  def index
    @customer = Customer.find(params[:id])
    @orders = @customer.orders
  end

  def show
    @order = Order.find(params[:id])
    @customer = Customer.find(params[:id])
  end

  private

  def order_params
    params.require(:order).permit(:customer_id, :payment_method, :address, :postcode, :name)
  end
end
