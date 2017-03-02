class StaticController < ApplicationController

  def index
      if params[:search].present?
          @listings = Listing.perform_search(params[:search])
      else
          @listings = Listing.paginate(:page => params[:page], :per_page => 3)
      end
  end
end
