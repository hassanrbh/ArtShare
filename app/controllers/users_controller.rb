class UsersController < ApplicationController
    def index
        # /users
        if params[:query]
            render :json => User.where("username LIKE ? ", "%#{params[:query]}%")
        else
            render :json => User.all
        end 
    end
    def show
        # /users/:id        
        user = User.find_by(:id => params[:id]) 
        render :json => user
    end
    def create
        # /users/new
        user = User.new(user_params)
        if user.save
            render :json => user
        else
            render :json => user.errors.full_messages, :status => :unprocessable_entity
        end
    end
    def update
        # /users/:id
        user = User.find_by(:id => params[:id])
        if user.update(user_params)
            render :json => user
        else
            render :json => user.errors.full_messages, :status => :unprocessable_entity
        end
    end
    def destroy
        # /users/:id
        user = User.find_by(:id => params[:id])
        user.destroy
        render :json => user
    end 

    protected

    def user_params
        params.require(:users).permit(:username)
    end
end