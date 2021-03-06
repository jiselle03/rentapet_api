class ApplicationController < ActionController::API
  private

  def current_user
    if session[:user_id].present?
      @current_user ||= User.find_by(id: session[:user_id])
    end
  end

  def authenticate_user!
    unless current_user.present?
      render( 
        json: { 
          status: 401 
        }, 
        status: 401 # Not Authorized
      )
    end
  end
end
