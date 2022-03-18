<<<<<<< HEAD
class UsersController < ApplicationController
    def new
    end
    def create
    end
    def show
    end
=======
class UsersController < ApplicationController
    def new
        render :new
    end
    def create
        # sign up a user and create a record in the db
        @new_user = User.new(users_params)
        if @new_user.save
            log_in_user!(@new_user)
            redirect_to user_path(@new_user), notice: 'You have successfully registered'
        else
            redirect_to :new_user, error: "Try Again later"
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
>>>>>>> 156e72320a57e48af9175d90374eb80aaef09e36
end