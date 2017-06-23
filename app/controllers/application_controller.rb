class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user
  def current_user
  	@current_user ||=User.find(session[:user_id]) if session[:user_id]
  rescue ActiveRecord::RecordNotFound
  end
  # before_filter :require_user
  def require_user
  	redirect_to '/login' unless current_user

  end
end

# line 6 and line 8 is used when there is no users thank you stackoverflow
