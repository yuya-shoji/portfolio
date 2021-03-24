class CustomersController < ApplicationController

  def show
  end

  def edit
    @customer = current_customer
  end

  def update
    @customer = current_customer
    @customer.update(customer_params)
    redirect_to customer_path(current_customer.id)
  end

  def quit
    @customer = Customer.find_by(params[:id])
  end

  def out
    @customer = current_customer
    @customer.update(is_active: true)
    reset_session
    redirect_to withdraw_customers_path
  end

  def withdraw
  end

  private
  def customer_params
    params.require(:customer).permit(:name, :email, :encrypted_password, :address, :telephone_number, :is_active)
  end

end
