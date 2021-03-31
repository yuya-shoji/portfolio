class ContactsController < ApplicationController

  def index
    @contact = Contact.new
  end

  def create
    @reservation = params[:reservation_id]
    @contact = Contact.new(contact_params)
    @contact.reservation_id = @reservation
    @contact.save!
    redirect_to reservation_path(@reservation)
  end

  private

  def contact_params
    params.require(:contact).permit(:reservation_id,:question,:answer)
  end
end
