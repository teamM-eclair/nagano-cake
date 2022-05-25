class CartItemsController < ApplicationController
# before_action :correct_customer

  def create
    @cart_item = CartItem.new(cart_item_params)
    @cart_item.customer_id = current_customer.id
    if @cart_item.save
      redirect_to cart_items_path
    else
      @customer = Customer.find(current_customer.id)
      redirect_to public_item_path
    end
  end

  def index
    @cart_items = current_customer.cart_items
    @cart_item = CartItem.new
    @customer = current_customer.id
  end

  def update
    @cart_items = CartItem.find(current_customer.id)
    if @cart_items.update(cart_item_params)
      redirect_to new_public_order_path
    else
      @cart_item = CartItem.all
      @customer = current_customer.id
      render :index
    end
  end

  def destroy
    @cart_item = CartItem.find(params[:id])
    @cart_item.destroy
    redirect_to cart_items_path
  end

  def all_destroy
    current_customer.cart_items.destroy_all
    redirect_to cart_items_path
  end

private

  def cart_item_params
    params.require(:cart_item).permit(:item_id, :amount)
  end

  # def correct_customer
  #   @customer = cart_item.customer
  #   redirect_to(new_customer_session_path) unless @customer == correct_customer
  # end
end
