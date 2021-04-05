class ReservationsController < ApplicationController
  helper_method :sort_column, :sort_direction

  def index
    @reservations = current_customer.reservations.order("#{sort_column} #{sort_direction}")
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

  def thank
  end

  private
  def reservation_params
    params.require(:reservation).permit(:customer_id,:admin_id,:start_time, :end_time, :dated_on, :title, :name, :staff)
  end

  def sort_direction
  %w[asc desc].include?(params[:direction]) ? params[:direction] : 'asc'
  end

  def sort_column
  Reservation.column_names.include?(params[:sort]) ? params[:sort] : 'created_at'
  end
end
