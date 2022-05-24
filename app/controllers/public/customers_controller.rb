class Public::CustomersController < ApplicationController
  def show
    @customer = current_customer
  end

  def quit
    @customer = current_customer
  end

  def out
  end

  def edit
    @customer = current_customer
  end

  def update
    @customer = current_customer
  end
  
  
  private
  
  def customer_params
    params.require(:customer).permit(:first_name, :last_name, :first_name_kana, :last_name_kana, :phone_number, :postcode, :address)
  end
end
