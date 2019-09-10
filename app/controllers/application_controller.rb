class ApplicationController < ActionController::Base

  protect_from_forgery with: :exception

  include SessionsHelper

  def authenticate_user

    if session[:user_id] == nil
    
    redirect_to new_session_path
    
    end
    
  end

end
