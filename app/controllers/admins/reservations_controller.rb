class Admins::ReservationsController < ApplicationController
    def index
    end

    def confirm
    end

    def complete
    end

    def show
    end

    def edit
    end

    def update
    end

    def destory
    end

    private
     def reservation_params
        params.require(:reservation).permit(:dated_on, :title, :name, :staff)
     end

end
