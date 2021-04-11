class Admins::ContactsController < ApplicationController
  def index
    @reservation = Reservation.find(params[:reservation_id])
    @contacts = Contact.where(reservation_id:params[:reservation_id])
  end

  def update
    @contact = Contact.find(params[:id])
    @contact.reservation_id = params[:reservation_id]
    @customer = Customer.find_by(id:@contact.reservation.customer_id)
    @contact.update(contact_params)
    ContactMailer.send_when_admin_reply(@customer, @contact).deliver
    redirect_to action: :index
  end

  def show
    @contact = Contact.find_by(id:params[:id])
  end

  private

  def contact_params
    params.require(:contact).permit(:reservation_id,:question,:answer)
  end

end
