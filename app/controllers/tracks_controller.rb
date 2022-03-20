class TracksController < ApplicationController
    def index
    end
    def show
        @track = Track.find_by(:id => params[:id])
        render :show
    end
    def new
        @album = Album.find_by(:id => params[:album_id])
        render :new
    end
    def create
        @track = Track.new(tracks_params)
        if @track.save
            flash.now[:success] = "Track created successfully"
            redirect_to track_path(@track.id)
        else
            flash[:errors] = @track.errors.full_messages
            redirect_to album_path(@track.album.id)
        end
    end

    private

    def tracks_params
        params.require(:tracks).permit(
            :title,
            :album_id,
            :ord,
            :lyrics,
            :track_type
        )
    end
end
