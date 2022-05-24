class Public::OrdersController < ApplicationController
  def new
    @order = Order.new
    @customer = Customer.find(current_customer.id)
    @delivery = Delivery.all #find(current_customer.id)
  end

  def confirm
    @order = Order.new(order_params)
    @cart_items = CartItem.all #.allだとすべてのカート内商品を呼び込んじゃう?
    @customer = current_customer

    if params[:address] == 0
      @order.postcode = @customer.postcode
      @order.address = @customer.address
      @order.name = @customer.name
    elsif params[:address] == 1
      Delivery.find([:order][:address_id] )
     [:order][:address_id]
    end

    @order.postcode = current_customer.postcode
    @order.address = current_customer.address
    @order.name = current_customer.first_name + current_customer.last_name

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
    @orders = current_customer.orders
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
