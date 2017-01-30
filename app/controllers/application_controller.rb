class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  include SessionsHelper

  private

   def current_user
     # FILL IN THIS METHOD!
     # if there is NOT someone logged in,
     # redirect to the login page
      @current_user ||= User.find(session[:user_id]) if session[:user_id]
   end
   helper_method :current_user

    def authorize
      redirect_to '/login' unless current_user
    end
end
