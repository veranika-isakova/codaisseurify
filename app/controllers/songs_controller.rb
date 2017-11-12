class SongsController < ApplicationController

  before_action :authenticate_user!

  def new
    @song = Song.new
  end

  def create
    @song = Song.new(song_params)
    artist = Artist.find(params[:artist_id])
    @song.artist = artist
    if @song.save
      redirect_to @song.artist, notice: "Song created"
    else
      render :new
    end
  end

  def edit
    @song = Song.find(params[:id])
  end

  def update
    if @song.update(song_params)
      redirect_to @song, notice: "Song updated"
    else
      render :edit
    end
  end

  def destroy
    @song = Song.find(params[:id])
    @song.destroy
    redirect_to artist_path(@song.artist.id)
  end

  private

  def song_params
    params
      .require(:song)
      .permit(:song_name, :album_name, :release_date, :artist_id)
  end
end
