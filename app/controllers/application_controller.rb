# frozen_string_literal: true

class ApplicationController < ActionController::Base
  add_flash_types :error, :notice, :success, :delete, :update
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

  private

  def require_login!
    if current_user.nil?
      flash[:errors] = ['You must be logged in to continue']
      redirect_to signin_path
    end
  end

  def already_logged_in?
    unless current_user.nil?
      flash[:errors] = ['You already logged In ! 🧨🗡']
      redirect_to root_url
    end
  end

  def admin_panel?
    if current_user.admin != true
      flash[:errors] = ['This is A Hidden Panel, Where Are you Goinng ❌ 🚷']
      redirect_to root_url
    end
  end

  def check_if_user_activated(user)
    if user.activated == false
      flash[:errors] = ["#{user.email} Make Sure You Activate Your Account"]
      redirect_to signin_path
    else
      log_in_user!(user)
      redirect_to bands_path, success: ["Welcome Again #{user.email}"]
    end
  end

  def check_if_user_activated_registration(user)
    if user.activated == false
      flash[:errors] = ['Successfully created your account! Check your inbox for an activation email.']
      redirect_to signin_path
    else
      log_in_user!(@new_user)
      redirect_to bands_path, success: ['Thanks For Your Confirmation']
    end
  end
end
