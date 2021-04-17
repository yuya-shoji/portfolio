class ReservationsController < ApplicationController
  helper_method :sort_column, :sort_direction
  before_action :set_reservation, only: [:show]
  before_action :authenticate_customer!


  def index
    @reservations = current_customer.reservations.where(end_time: DateTime.now..Float::INFINITY).order("#{sort_column} #{sort_direction}").page(params[:page]).per(8)
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
      ReservationMailer.complete_reservation(@reservation.customer,@reservation).deliver
      redirect_to thank_reservations_path
    else
      render "new"
    end
  end

  def select
    @reservation = Reservation.new
    @admins = Admin.all
    @hash = Hash.new {}
    @admins.each do |admin|
      @hash[admin.name] = admin.id
    end
  end

  def new
    @reservation = Reservation.new(reservation_params)
    @reservations = Reservation.where(end_time: DateTime.now..Float::INFINITY).where(admin_id:@reservation.admin_id)
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
      @reservations = Reservation.where(end_time: DateTime.now..Float::INFINITY).where(admin_id:@reservation.admin_id)
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
    params.require(:reservation).permit(:customer_id,:admin_id,:start_time, :end_time, :dated_on, :title, :name, :staff, :detail)
  end

  def set_reservation
      @r = Reservation.find(params[:id])
  end

  def sort_direction
  %w[asc desc].include?(params[:direction]) ? params[:direction] : 'asc'
  end

  def sort_column
  Reservation.column_names.include?(params[:sort]) ? params[:sort] : 'created_at'
  end
end
