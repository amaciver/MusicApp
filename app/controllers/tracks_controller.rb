class TracksController < ApplicationController
  before_action :ensure_login


  def new
  end

  def create
    track = Track.new(track_params)
    if track.save
      redirect_to album_url(track.album_id)
    else
      flash.now[:errors] = track.errors.full_messages
      # redirect_to new_album_track_url(params[:album_id])
      render :new
    end
  end

  def show
    @track = Track.find_by(id: params[:id])
  end

  def edit
    @track = Track.find_by(id: params[:id])
  end

  def update
    track = Track.find_by(id: params[:id])
    if track.update(track_params)
      redirect_to album_url(track.album)
    else
      redirect_to edit_track_url(track)
    end
  end

  def destroy
    track = Track.find_by(id: params[:id])
    if track.destroy
      redirect_to album_url(track.album)
    else
      redirect_to track_url(track)
    end
  end

  private
  def track_params
    params.require(:track).permit(:album_id, :name, :bonus, :lyrics)
  end
end
