class ApplicationController < ActionController::Base
  include Pundit::Authorization

   rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized


  def home
    redirect_to home_path
  end
  
  private

  def user_not_authorized
    flash[:alert] = "You are not authorized to perform this action."
    redirect_to(request.referrer || root_path)
  end
end
