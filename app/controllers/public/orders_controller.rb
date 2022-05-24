class Public::OrdersController < ApplicationController
  def new
    @order = Order.new
    @customer = Customer.find(current_customer.id)
    @delivery = Delivery.all #find(current_customer.id)
  end

  def confirm
    @order = Order.new(order_params)    
    binding.pry
    @cart_items = CartItem.all #.allだとすべてのカート内商品を呼び込んじゃう?
    @customer = corrent_customer
    
    if params[:address] == 0
      @order.postcode = @customer.postcode
      @order.address = @customer.address
      @order.name = @customer.name
    elif params[:address] == 1
       = Delivery.find([:order][:address_id] )
     [:order][:address_id] 
    end
      
    @order.postcode = current_customer.postcode
    @order.address = current_customer.address
    @order.name = current_customer.first_name + current_cutomer.last_name

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
