class DeliveriesController < ApplicationController
  def index
    @deliveries = Delivery.all
    @delivery = Delivery.new
  end

  def create
    @delivery = Delivery.new(delivery_params)
    @delivery.customer_id = current_customer.id
    if @delivery.save
      redirect_to deliveries_path(@delivery), notice: "配達先を保存しました"
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
  end

  def update
  end

end
