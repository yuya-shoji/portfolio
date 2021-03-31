class Admins::HomesController < ApplicationController
  def top
    @admin = current_admin
  end

  def about
    @admin = current_admin
    @reservations = Reservation.where(staff:@admin.name)
  end

end
