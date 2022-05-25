class Public::OrdersController < ApplicationController
  def new
    @order = Order.new
    @customer = Customer.find(current_customer.id)
    @delivery = current_customer.deliveries
  end

  def confirm
    @order = Order.new(order_params)
    @cart_items = current_customer.cart_items
    @customer = current_customer
    
    # 支払方法
    if params[:order][:payment_method] == "credit_card"
      @payment_method = Order.payment_methods.key(0)
    else
      @paymentmethod = Order.payment_methods.key(1)
    end
    
    # お届け先
    # if params[:order][:address] == 0
    #   @order.postcode = @customer.postcode
    #   @order.address = @customer.address
    #   @order.name = @customer.name
    # elsif params[:address] == 1
    #   Delivery.find([:order][:address_id] )
    #   [:order][:address_id]
    # else #新規配送先の場合
      
    
    # end

    # @order.postcode = current_customer.postcode
    # @order.address = current_customer.address
    # @order.name = current_customer.first_name + current_customer.last_name


  end

  def create
    @order = Order.new(order_params)
    # Orderモデルに注文を保存
    # OrderDetailモデルにカート内商品の情報をもとに保存
    @order.save
    # カート内商品をすべ削除
    # 購入画面に遷移
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
