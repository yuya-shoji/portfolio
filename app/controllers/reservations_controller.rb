class ReservationsController < ApplicationController

  def index
  end

  def show
  end

  def create
  end

  def new
  end

  def log
  end

  def thank
  end

  private
  def reservation_params
    params.require(:reservation).permit(:dated_on, :title, :name, :staff)
  end

end
