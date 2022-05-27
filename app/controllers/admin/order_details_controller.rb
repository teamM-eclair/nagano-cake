class Admin::OrderDetailsController < ApplicationController

  def update
     @order_detail = OrderDetail.find(params[:id])
     @order = @order_detail.order
     @order_detail.update(order_detail_params)

      #製作ステータスが1つでも(製作中)なら
    if @order_detail.product_status == "under_manufacture"
			#注文ステータスを2(製作中)に更新
			@order.update(status: 2)
			
			# カート内商品すべてが製作完了なら
		elsif @order.order_details.count ==  @order.order_details.where(product_status: "completion_of_production").count
		  #注文ステータスを3(発送準備中)に更新
			@order.update(status: 3) 
		end
		#注文詳細に遷移
    redirect_to admin_order_path(@order_detail.order_id)
  end
  
  
  private
  
    def order_detail_params
      params.require(:order_detail).permit(:order_id, :item_id, :amount, :purchase_price, :product_status)
    end
end
