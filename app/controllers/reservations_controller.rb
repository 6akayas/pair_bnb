class ReservationsController < ApplicationController


    def preview
        start_date = Date.parse(params[:start_date])
        end_date = Date.parse(params[:end_date])

        output = {
            conflict: is_conflict(start_date, end_date)
        }

        render json: output
    end


    def index
        @reservations = Reservation.find_by(listing_id: params[:listing_id])
    end

    def new
        @reservation = Reservation.new

    end

    def create
        @listing = Listing.find_by(id: params[:id])
        @reservation = current_user.reservations.new(reservation_params)
        @reservation.listing_id = params[:listing_id]
        @reservation.total_price = @reservation.listing.price*(@reservation.end_date - @reservation.start_date)
        if @reservation.save
            redirect_to listing_reservation_path(@reservation.id), success: "Reservation saved!"
        else
            redirect_to new_listing_reservation_path(params[:listing_id]), danger: "Reservation not successful!"
        end
    end

    def show
        @reservation = Reservation.find(params[:listing_id])
    end


    private

    def reservation_params
        params.require(:reservation).permit(:start_date, :end_date)
    end

    def is_conflict(start_date, end_date)
        @listing = Listing.find(params[:listing_id])

        check = @listing.reservations.where("? < start_date AND end_date < ?", start_date, end_date)
        check.size > 0? true: false
    end

end
