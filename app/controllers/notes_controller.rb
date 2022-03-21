class NotesController < ApplicationController
    before_action :require_login! 
    def destroy
        note = Note.find_by(:id => params[:id])
        note.destroy
        redirect_to track_path(note.track.id) 
    end
    def create
        note = Note.new(notes_params)
        note.user_id = current_user.id

        if note.save
            flash[:success] = ["Note created successfully"]
            redirect_to track_path(note.track)
        else
            flash[:error_me] = note.errors.full_messages
            redirect_to track_path(note.track)
        end
    end

    private
    def notes_params
        params.require(:notes).permit(
            :longnote,
            :user_id,
            :track_id
        )
    end
end
