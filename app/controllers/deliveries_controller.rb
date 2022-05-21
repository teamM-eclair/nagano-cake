class DeliveriesController < ApplicationController

  def index
    @deliveries = Delivery.all
    @delivery = Delivery.new
  end

  def create
    @delivery = Delivery.new(delivery_params)
    @delivery.customer_id = current_customer.id
    if @delivery.save
      redirect_to deliveries_path(@delivery), notice: "配達先情報を保存しました"
    else
      @deliveries = Delivery.all
      render 'index'
    end
  end

  def destroy
    @delivery.destroy
    redirect_to deliveries_path
  end

  def edit
    @delivery = Delivery.find(params[:id])
  end

  def update
    @delivery = Delivery.find(params[:id])
    if @delivery.update(delivery_params)
      redirect_to deliveries_path(@delivery), notice: "配達先情報を更新しました"
    else
      render "edit"
    end
  end

  private

  def delivery_params
    params.require(:delivery).permit(:postcode, :address, :name)
  end

end
