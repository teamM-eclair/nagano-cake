class Admin::OrdersController < ApplicationController
  before_action :authenticate_admin!
  
  def show
    @order = Order.find(params[:id])
    @order_details = @order.order_details
  end

  def update
    @order = Order.find(params[:id])
    @order_details = @order.order_details
    @order.update(order_params)
    
      #注文ステータスが1(入金確認)なら下をする
    if @order.status == "confirming_payment" 
      #製作ステータスを1(製作待ちに)　更新
      @order_details.update_all(product_status: 1) 
    end
    
      redirect_to admin_order_path(params[:id])
   
  end

  private

  def order_params
    params.require(:order).permit(:customer_id, :shipping_fee, :bill, :payment_method, :address, :postcode, :name, :status)
  end
  
  # def order_detail_params
  #   params.require(:order_detail).permit(:amount, :purchase_price, :product_status)
  # end
  
end
