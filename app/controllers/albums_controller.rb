# frozen_string_literal: true

class AlbumsController < ApplicationController
  before_action :require_login!
  def show
    @album = Album.find_by(id: params[:id])
    render :show
  end

  def new
    @band = Band.find_by(id: params[:band_id])
    @albums = Album.new(band_id: params[:band_id])
    render :new
  end

  def create
    @albums = Album.new(albums_params)
    if @albums.save
      flash[:success] = 'Album created successfully'
      redirect_to album_path(@albums.id)
    else
      flash[:error] = @albums.errors.full_messages
      render :new
    end
  end

  def edit
    @album = Album.find_by(id: params[:id])
    render :edit
  end

  def update
    @album = Album.find_by(id: params[:id])

    if @album.update(albums_params)
      flash[:update] = 'Album updated successfully'
      redirect_to album_path(@album.id)
    else
      flash[:error] = @albums.errors.full_messages
      render :edit
    end
  end

  def destroy
    @album = Album.find_by(id: params[:id])
    @album.destroy
    flash.now[:delete] = 'Album deleted successfully'
    redirect_to band_path(@album.band.id)
  end

  private

  def albums_params
    params.require(:albums).permit(:name, :band_id, :live, :year)
  end
end
