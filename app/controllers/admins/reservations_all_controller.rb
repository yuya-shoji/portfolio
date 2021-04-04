class Admins::ReservationsAllController < ApplicationController
  def index
    @reservations = Reservation.all
    @admins = Admin.all
    @hash = Hash.new {}
    @admins.each do |admin|
      @hash[admin.name] = admin.id
    end
  end

  def search
    @reservations =Reservation.where(admin_id:params[:keyword])
    @admins = Admin.all
    @hash = Hash.new {}
    @admins.each do |admin|
      @hash[admin.name] = admin.id
    end
  end
end
