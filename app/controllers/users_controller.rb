class UsersController < ApplicationController
    def new
        render :new
    end
    def create
        # sign up a user and create a record in the db
        @new_user = User.new(users_params)
        if @new_user.save
            log_in_user!(@new_user)
            redirect_to bands_path, notice: ['You have successfully registered']
        else
            flash[:error] = @new_user.errors.full_messages
            redirect_to new_user_path, error: @new_user.errors.full_messages
        end
    end

    def show
        # show the user inforamtionally
        @user_finder = User.find_by(:id => params[:id])
        render :show
    end

    private
    def users_params
        params.require(:users).permit(:email,:password, :session_token)
    end
end