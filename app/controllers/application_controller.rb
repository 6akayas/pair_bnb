class ApplicationController < ActionController::Base
    include Clearance::Controller
    protect_from_forgery with: :exception
    add_flash_types :danger, :info, :warning, :success

    def index
    end
	
		# # authorization code
 #    def allowed?
 #      if user.customer
 #        flash[:warning] = "Sorry. You are not allowed to perform this action."
 #        return redirect_to root_url, warning: "Sorry. You do not have the permission."
 #      else
 #      end 
 #    end
	

end
