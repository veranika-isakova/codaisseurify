class ArtistsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  def index
    @artists = Artist.all
  end

  def show
    @artist = Artist.find(params[:id])
    @song = Song.new
  end

  def destroy
    @artist = Artist.find(params[:id])
    @artist.destroy
    redirect_to artists_path
  end

  private

  def artist_params
    params
      .require(:artist)
      .permit(:name, :country, :biography, :official_site)
  end
end
