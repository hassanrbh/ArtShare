class SessionsController < ApplicationController
    def new
        @new_user = User.new
        render :new
    end
    def create
        # Find the credentials of the user for sign in
        user = User.find_by_credentials!(
            params[:users][:email],
            params[:users][:password]
        )

        if user.present?
            check_if_user_activated(user)
        else
            flash[:errors] = ["credentials failed, Try Again ! 🔫 🚓"]
            redirect_to new_session_path
        end
    end
    def destroy
        logout!
        flash[:notice] = ["You have been logged out"]
        redirect_to new_session_path
    end
end