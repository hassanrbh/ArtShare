class AlbumsController < ApplicationController
    def show
        @album = Album.find_by(:id => params[:id])
        render :show
    end
    def new
        @band = Band.find_by(:id => params[:band_id])
        @albums = Album.new(:band_id => params[:band_id])
        render :new
    end
    def create
        @albums = Album.new(albums_params)

        if @albums.save
            flash[:success] = "Album created successfully"
            redirect_to album_path(@albums.id)
        else
            @band = @albums.band
            flash[:error] = @albums.errors.full_messages
            render :new
        end
    end
    def update
        render :edit
    end
    def edit
    end
    def destroy
    end

    private

    def albums_params
        params.require(:albums).permit(:name, :band_id, :live, :year)
    end
end