class StaticController < ApplicationController

  def index
  	if params[:search].present?
      @listings = Listing.perform_search(params[:search])
    else
      @listings = Listing.all
	end
  end 

  
end
