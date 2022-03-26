# frozen_string_literal: true

class BandsController < ApplicationController
  before_action :require_login!
  def index
    # show all the bands
    @bands = Band.all
    render :index
  end

  def new
    render :new
  end

  def create
    @band = Band.new(bands_params)

    if @band.save
      flash[:success] = 'The band was successfully created'
      redirect_to band_path(@band)
    else
      flash[:error] = 'This Band name already exists'
      redirect_to new_band_path
    end
  end

  def show
    @band = Band.find_by(id: params[:id])
    if @band.present?
      render :show
    else
      redirect_to bands_path
    end 
  end

  def edit
    @band_edit = Band.find_by(id: params[:id])
    render :edit
  end

  def update
    band_find = Band.find_by(id: params[:id])

    if band_find.update(bands_params)
      flash[:success] = 'Updated band successfully'
      redirect_to band_path(band_find)
    else
      flash[:error] = 'Error updating band'
      redirect_to edit_band_path
    end
  end

  def destroy
    band = Band.find_by(id: params[:id])
    band.destroy
    redirect_to bands_path
  end

  private

  def bands_params
    params.require(:bands).permit(:name)
  end
end
