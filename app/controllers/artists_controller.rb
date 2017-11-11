class ArtistsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  def index
    @artists = Artist.all
  end

  def show
    @artist = Artist.find(params[:id])
  end

  def new
    @artist = Artist.new
  end

  def create
    @artist = Artist.new(artist_params)
    if @artist.save
      redirect_to @artist, notice: "Artist created"
    else
      render :new
    end
  end

  def edit
    @artist = Artist.find(params[:id])
  end

  def update
    if @artist.update(artist_params)
      redirect_to @artist, notice: "Artist updated"
    else
      render :edit
    end
  end

  private

  def artist_params
    params
      .require(:artist)
      .permit(:name, :country, :biography, :official_site)
  end
end
