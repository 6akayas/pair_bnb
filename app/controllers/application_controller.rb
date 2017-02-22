class ApplicationController < ActionController::Base
    include Clearance::Controller
  protect_from_forgery with: :exception

  def index
    render 'application/application'
  end
end
