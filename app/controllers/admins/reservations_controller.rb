class Admins::ReservationsController < ApplicationController
    def index
        @reservations = Reservation.where(admin_id:current_admin.id)
        @reservations = Reservation.all.page(params[:page]).per(8)
    end

    def confirm
        @reservation = Reservation.find(params[:id])
    end

    def complete
    end

    def show
        @reservation = Reservation.find(params[:id])
        @customer = @reservation.customer
    end

    def edit
    end

    def update
    end

    def destroy
        @reservation = Reservation.find(params[:id])
        @reservation.destroy
        redirect_to admins_complete_reservation_path
    end

    private
     def reservation_params
        params.require(:reservation).permit(:id,:dated_on, :title, :staff, :name, :email, :password, :encrypted_password)
     end

end
