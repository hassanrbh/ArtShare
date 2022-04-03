class LikesController < ApplicationController
    def create
        @like = current_user.likes.new(likes_params)
        if !@like.save
            flash[:errors] = ["You cannot like right now"]
        end
        redirect_to @like.note
    end
    def destroy
        @like = current_user.likes.find_by(:id => params[:id])
        note = @like.note
        @like.destroy
        redirect_to note
    end

    private 

    def likes_params
        params.require(:like).permit(:note_id)
    end
end