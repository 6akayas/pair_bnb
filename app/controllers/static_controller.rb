class StaticController < ApplicationController
  def index
    @listings = Listing.paginate(:page => params[:page], :per_page => 5)
  end
end
