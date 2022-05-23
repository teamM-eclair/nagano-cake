class DeliveriesController < ApplicationController
  before_action :authenticate_customer!

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

  def edit
    @delivery = Delivery.find(params[:id])
  end

  def destroy
    @delivery = Delivery.find(params[:id])
    @delivery.destroy
    redirect_to deliveries_path(@delivery)
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
