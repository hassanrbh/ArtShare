class CommentsController < ApplicationController
    def index
        # retrieve comments for user or artwork
        # /users
        case 
        when comment_params[:author_id]
            comments = Comment.where(:author_id => comment_params[:author_id])
        when comment_params[:post_id]
            comments = Comment.where(:post_id => comment_params[:post_id])
        else
            comments = Comment.all
        end
        render :json => comments
    end
    def create
        # POST:/users
        comment = Comment.new(comment_params)
        if comment.save
            render :json => comment
        else
            render :json => comment.errors.full_messages, :status => :unprocessable_entity
        end
    end
    def destroy
        comment = Comment.find_by(:id => comment_params[:id])
        comment.destroy
        render :json => comment
    end

    protected

    def comment_params
        params.require(:comments).permit(:author_id, :post_id, :body)
    end
end