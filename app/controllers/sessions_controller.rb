class SessionsController < ApplicationController
    def new
        @new_user = User.new
        render :new
    end
    def create
        # Find the credentials of the user for sign in
        user = User.find_by_credentials(
            params[:users][:email],
            params[:users][:password]
        )

        if user.present?
            log_in_user!(user)
            redirect_to user_path(@new_user), :success => "Welcome Again #{@new_user.email}"
        else
            redirect_to new_session_path, :error => "credentials failed"
        end
    end
    def destroy
        logout!
        redirect_to new_session_path, :notice => "You have been logged out"
    end
end