require 'rails_helper'

RSpec.describe Artist, type: :model do
  describe "validations" do
    it "is invalid without a name" do
      artist = Artist.new(name: nil)
      artist.valid?
      expect(artist.errors).to have_key(:name)
    end

    it "is invalid without a country" do
      artist = Artist.new(country: nil)
      artist.valid?
      expect(artist.errors).to have_key(:country)
    end

    it "is invalid with a biography longer than 1000 characters" do
      artist = Artist.new(biography: "a"*1001)
      artist.valid?
      expect(artist.errors).to have_key(:biography)
    end
    it "is invalid without an official site" do
      artist = Artist.new(official_site: nil)
      artist.valid?
      expect(artist.errors).to have_key(:official_site)
    end
  end
  describe "association with song" do
  let(:artist) { create :artist }
  let!(:song) { create :song, artist: artist }

  it "has many songs" do
    song_1 = artist.songs.new(song_name: "Knocking on heaven's door")
    song_2 = artist.songs.new(song_name: "Creep")
    song_3 = artist.songs.new(song_name: "Street Spirit")
    song_4 = artist.songs.new(song_name: "Smells Like Teen Spirit ")
    song_5 = artist.songs.new(song_name: "In Bloom")
    song_6 = artist.songs.new(song_name: "Basic Space")

    expect(artist.songs).to include(song_1)
    expect(artist.songs).to include(song_2)
    expect(artist.songs).to include(song_3)
    expect(artist.songs).to include(song_4)
    expect(artist.songs).to include(song_5)
    expect(artist.songs).to include(song_6)
  end

  it "deletes associated songs" do
    expect { artist.destroy }.to change(Song, :count).by(-1)
  end
end
  describe "association with photo" do
  let(:artist) { create :artist }
  let!(:photo) { create :photo, artist: artist }

  it "has many photos" do
    photo1 = artist.photos.new(remote_image_url: "http://res.cloudinary.com/veranikaisakova/image/upload/v1510427478/Bob-Dylan-Picture-1960s-Style-Sunglasses_j4dbks.jpg")
    photo2 = artist.photos.new(remote_image_url: "http://res.cloudinary.com/veranikaisakova/image/upload/v1510428117/a276a56ab39b41f68ce338cee2f6a275_qvyi88.jpg")
    photo3 = artist.photos.new(remote_image_url: "http://res.cloudinary.com/veranikaisakova/image/upload/v1510428156/vgupa0jpkeie0wr0j8er_c4c6oj.jpg")
    photo4 = artist.photos.new(remote_image_url: "http://res.cloudinary.com/veranikaisakova/image/upload/v1510428057/thexxTOL260110_o5osj3.jpg")

    expect(artist.photos).to include(photo1)
    expect(artist.photos).to include(photo2)
    expect(artist.photos).to include(photo3)
    expect(artist.photos).to include(photo4)
  end

  it "deletes associated photos" do
    expect { artist.destroy }.to change(Photo, :count).by(-1)
  end
end
end
