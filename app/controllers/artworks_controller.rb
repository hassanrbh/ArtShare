class ArtworksController < ApplicationController
    def index
        # /artworks
        artwork = Artwork.all
        render :json => artwork
    end
    def show
        # /artworks/:id
        artwork = Artwork.find_by(:id => params[:id])
        render :json => artwork
    end
    def create
        # /artworks
        artwork = Artwork.new(artwork_params)
        if artwork.save
            render :json => artwork
        else
            render :json => artwork.errors.full_messages, :status => :unprocessable_entity
        end
    end
    def update
        # /artworks/:id
        artwork = Artwork.find_by(:id => params[:id])
        if artwork.update(artwork_params)
            render :json => artwork
        else
            render :json => artwork.errors.full_messages, :status => :unprocessable_entity
        end
    end
    def destroy
        # /artworks/:id
        artwork = Artwork.find_by(:id => params[:id])
        artwork.destroy
        render :json => artwork
    end

    protected

    def artwork_params
        params.require(:artworks).permit(:title, :image_url, :artist_id)
    end
end