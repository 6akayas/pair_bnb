class BraintreeController < ApplicationController

    def new
        @client_token = Braintree::ClientToken.generate
    end

    def checkout
        nonce_from_the_client = params[:checkout_form][:payment_method_nonce]
        @reservation = Reservation.find_by(id: params[:reservation_id])
        result = Braintree::Transaction.sale(
            :amount => @reservation.total_price.to_s,
            :payment_method_nonce => nonce_from_the_client,
            :options => {
                :submit_for_settlement => true
            }
        )

        if result.success?
          redirect_to reservation_braintree_show_path(@reservation.id), success: "Transaction successful!"
        else
          redirect_to new_listing_reservation_path(:listing_id), danger: "Transaction failed. Please try again."
        end
    end

    def show
      @reservation = Reservation.find_by(id: params[:reservation_id])
    end


end
