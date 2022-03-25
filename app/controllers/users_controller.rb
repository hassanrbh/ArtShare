# frozen_string_literal: true

class UsersController < ApplicationController
  before_action :already_logged_in?, only: %i[new create]
  before_action :admin_panel?, only: %i[index destroy show]
  def index
    @users = User.all
    render :index
  end

  def new
    render :new
  end

  def create
    # sign up a user and create a record in the db
    @new_user = User.new(users_params)
    if @new_user.save
      check_if_user_activated_registration(@new_user)
      # Welcome Message To The User
      messg = UserMailer.welcome_email(@new_user)
      messg.deliver
      # Send A confirmation Email To The User
      UserMailer.activate_account(@new_user).deliver_now!
    else
      flash[:errors] = @new_user.errors.full_messages
      redirect_to new_user_path, error: @new_user.errors.full_messages
    end
  end

  def show
    # show the user inforamtionally
    @user_finder = User.find_by(id: params[:id])
    render :show
  end

  def destroy
    user = User.find_by(id: params[:id])
    user.destroy
    flash[:success] = ['Deleted Successfully']
    redirect_to users_path
  end

  def activate
    # check if the user clicked the link in the email
    activation_lookup = User.find_by(activation_token: params[:activation_token])
    if params[:activation_token] == activation_lookup.activation_token
      activation_lookup.toggle(:activated)
      activation_lookup.save!
      log_in_user!(activation_lookup)
      redirect_to root_url, success: ['Thanks For Your Confirmations']
    end
  end

  private

  def users_params
    params.require(:users).permit(:email, :password, :session_token, :activation_token)
  end
end
