class ReservationsController < ApplicationController

  def index
    @reservations = Reservation.all
  end

  def show
    @reservations = Reservation.where(customer_id:current_customer.id)
  end

  def create
    @reservation = Reservation.new(reservation_params)
    @reservation.save!
    redirect_to thank_reservations_path
  end

  def new
    @reservation = Reservation.new
  end

  def log
  end

  def thank
  end

  private
  def reservation_params
    params.require(:reservation).permit(:customer_id, :dated_on, :title, :name, :staff)
  end

end
