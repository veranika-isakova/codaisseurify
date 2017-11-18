class Api::ArtistsController < ApplicationController

  skip_before_action :verify_authenticity_token

  def index
    render status: 200, json: {
      artists: Artist.all
    }.to_json
  end

  def destroy
    artist = Artist.find(params[:id])
    artist.destroy

    render status: 200, json: {
      message: "Artist successfully deleted"
    }.to_json
  end
end
