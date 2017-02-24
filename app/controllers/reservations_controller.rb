class ReservationsController < ApplicationController

    def index
        @reservations = Reservation.find_by(listing_id: params[:listing_id])
    end

    def new
        @reservation = Reservation.new

    end

    def create
        @reservation = current_user.reservations.new(reservation_params)
        @reservation.listing_id = params[:listing_id]
        if @reservation.save
          redirect_to listing_reservation_path(@reservation.id), success: "Reservation saved!"
        else
          redirect_to new_listing_reservation_path(@reservation.id), danger: "Reservation not successful!"
        end
    end

    private

    def reservation_params
      params.require(:reservation).permit(:start_date, :end_date)
    end

end
