class Public::OrdersController < ApplicationController
  def new
    @order = Order.new
    @customer = Customer.find(current_customer.id)
    @delivery = current_customer.deliveries
  end

  def confirm
    # 支払方法、新しいお届け先の場合の情報は10行目に入っている
    @order = Order.new(order_params)
    @cart_items = current_customer.cart_items
    @customer = current_customer
    
    # お届け先
        # ご自身の住所の場合
    if params[:order][:shipping_address] == "0"
      @order.postcode = @customer.postcode
      @order.address = @customer.address
      @order.name = @customer.last_name + @customer.first_name
      # 登録済み住所の場合
    elsif params[:order][:shipping_address] == "1"
      @delivery = Delivery.find(params[:order][:address_id])
      @order.postcode = @delivery.postcode
      @order.address = @delivery.address
      @order.name = @delivery.name
    end
  end

  def create
    @order = Order.new(order_params)
    @order.customer_id = current_customer.id
    # Orderモデルに注文を保存
    @order.save
    
    # OrderDetailモデルにカート内商品の情報をもとに保存
    current_customer.cart_items.each do |cart_item|
      @order_detail = OrderDetail.new
      @order_detail.item_id = cartt_item.item_id
      @order_detail.amount = cart_item.amount
      @order_detail.purchase_price = cart_item.item.with_tax_price
      @order_detail.order_id = @order.id
      @order_detail.save
    end
      
    # カート内商品をすべ削除
    current_customer.cart_items.destroy_all # @order.destroy.all?
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
    params.require(:order).permit(:customer_id, :shipping_fee, :bill, :payment_method, :address, :postcode, :name, :status)
  end
  
  # def order_detail_params
  #   params.require(:order_detail).permit(:payment_method, :address, :postcode, :name)    
  # end
end
