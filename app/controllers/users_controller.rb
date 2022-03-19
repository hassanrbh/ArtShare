class UsersController < ApplicationController
    def new
        render :new
    end
    def create
        @new_user = User.new(users_params)
        if @new_user.save
            log_in_user!(@new_user)
            redirect_to user_path(@new_user), notice: 'You have successfully registered'
        else
            redirect :new_user, error: 'Try Again later'
        end
    end
    def show
        @user_finder = User.find_by(:id => params[:id])
        render :show
    end
    
    private
    def users_params
        params.require(:users).permit(:email,:password,:session_token)
    end
end