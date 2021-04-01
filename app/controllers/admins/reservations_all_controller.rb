class Admins::ReservationsAllController < ApplicationController
  def index
    @reservations = Reservation.all
  end
end
