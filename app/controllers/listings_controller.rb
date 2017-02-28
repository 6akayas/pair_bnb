class ListingsController < ApplicationController

    def index
        @listings = Listing.all
        
    end

    def create

      new_listing = current_user.listings.new(listing_params)
      if new_listing.save
        redirect_to listing_path(new_listing), success: "Home saved!"
      else
        redirect_to listings_path, danger: "Home not saved. Please try again"
      end
    end

    def show
      @listing = Listing.find_by(id: params[:id])
    end

    private

    def listing_params
        params[:listing].permit(:price, :home_title, :summary, :address, :home_type, :room_type, :got_tv, :got_kitchen, :got_aircond, :got_internet, :got_gym, :got_pool, :bedroom, :bathroom, :accomodate, :user_id, {photos: []})
    end

end
