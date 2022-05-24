class Admin::OrderDetailsController < ApplicationController

  def update
     @oder_detail = OrderDetail.find(params[:id])
  end
end
