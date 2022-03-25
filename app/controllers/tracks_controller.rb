# frozen_string_literal: true

class TracksController < ApplicationController
  before_action :require_login!
  def show
    @track = Track.find_by(id: params[:id])
    render :show
  end

  def new
    @album = Album.find_by(id: params[:album_id])
    render :new
  end

  def create
    @track = Track.new(tracks_params)
    if @track.save
      flash.now[:success] = 'Track created successfully'
      redirect_to track_path(@track.id)
    else
      flash[:errors] = @track.errors.full_messages
      redirect_to album_path(@track.album.id)
    end
  end

  def edit
    @track = Track.find_by(id: params[:id])
    render :edit
  end

  def update
    @track = Track.find_by(id: params[:id])

    if @track.update(tracks_params)
      flash[:success] = 'Track updated successfully'
      redirect_to track_path(@track.id)
    else
      flash[:errors] = @track.error.full_messages
      redirect_to edit_track_path(@track.id)
    end
  end

  def destroy
    @track = Track.find_by(id: params[:id])
    @track.destroy
    redirect_to album_path(@track.album.id)
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
