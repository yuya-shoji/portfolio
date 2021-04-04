class ReservationsController < ApplicationController

  def index
    @reservations = Reservation.where(customer_id:current_customer.id)
  end

  def show
    @reservations = Reservation.find(params[:id])
    @contacts = Contact.where(reservation_id:@reservations)
  end

  def create
    @reservation = Reservation.new(reservation_params)
    @reservation.customer_id = current_customer.id
    if @reservation.valid?
      @reservation.save
      redirect_to thank_reservations_path
    else
      render "new"
    end
  end

  def new
    @reservation = Reservation.new
    @reservations = Reservation.where(customer_id:current_customer)
    @admins = Admin.all
    @hash = Hash.new {}
    @admins.each do |admin|
      @hash[admin.name] = admin.id
    end
  end

  def log
    @reservation = Reservation.new(reservation_params)
    @reservation.customer_id = current_customer.id
    if @reservation.invalid?
      @reservations = Reservation.where(customer_id:current_customer)
      @admins = Admin.all
      @hash = Hash.new {}
      @admins.each do |admin|
        @hash[admin.name] = admin.id
      end
      render :new
    else
    end
  end

  def search
    
  end

  def thank
  end

  private
  def reservation_params
    params.require(:reservation).permit(:customer_id,:admin_id,:start_time, :end_time, :dated_on, :title, :name, :staff)
  end

end
