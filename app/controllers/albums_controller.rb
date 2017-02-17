class AlbumsController < ApplicationController
  before_action :ensure_login

  def new
  end

  def create
    album = Album.new(album_params)
    if album.save!
      redirect_to band_url(album.band_id)
    else
      redirect_to new_album_url(album.band_id)
    end
  end

  def show
    @album = Album.find_by(id: params[:id])
  end

  def edit
    @album = Album.find_by(id: params[:id])
  end

  def update
    album = Album.find_by(id: params[:id])
    if album.update(album_params)
      redirect_to band_url(album.band)
    else
      redirect_to edit_album_url(album)
    end
  end

  def destroy
    album = Album.find_by(id: params[:id])
    if album.destroy
      redirect_to band_url(album.band)
    else
      redirect_to album_url(album)
    end
  end

  private
  def album_params
    params.require(:album).permit(:band_id, :title)
  end
end
