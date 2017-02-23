class ListingsController < ApplicationController

    def index
        @listings = Listing.all
    end

    def create

      new_listing = current_user.listings.new(listing_params)
      if new_listing.save
        @next = listing_path(new_listing)
        @notice = "Home saved!"
      else
        @next = listings_path
        @notice = "Home not saved. Please try again"
      end
      redirect_to @next, :notice => @notice
    end

    def show
      @listing = Listing.find_by(id: params[:id])
    end

    private

    def listing_params
        params[:listing].permit(:price, :home_title, :summary, :address, :home_type, :room_type, :got_tv, :got_kitchen, :got_aircond, :got_internet, :got_gym, :got_pool, :bedroom, :bathroom, :accomodate, :user_id)
    end

end
