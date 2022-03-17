class ApplicationController < ActionController::Base
    add_flash_types :error, :notice, :success
    helper_method :current_user
    protect_from_forgery with: :exception
    def log_in_user!(user)
        @current_user = user
        session[:session_token] = user.session_token
    end
    def current_user
        return nil if session[:session_token].nil?
        @current_user ||= User.find_by(session_token: session[:session_token])
    end
    def logged_in?
        current_user ? true : false
    end
    def logout!
        current_user.try(:reset_session_token!)
        session[:session_token] = nil
    end
end
