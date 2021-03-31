class Admins::HomesController < ApplicationController
  def top
  end

  def about
    @admin = current_admin
    @reservations = Reservation.where(staff:@admin.name)
  end

end
