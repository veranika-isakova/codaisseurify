require 'rails_helper'

RSpec.describe Song, type: :model do

  describe "validations" do

    it "is invalid without a song name" do
      song = Song.new(song_name: "")
      song.valid?
      expect(song.errors).to have_key(:song_name)
    end

    it "is invalid without an album_name" do
      song = Song.new(album_name: nil)
      song.valid?
      expect(song.errors).to have_key(:album_name)
    end

    it "is invalid without a date of the release" do
      song = Song.new(release_date: nil)
      song.valid?
      expect(song.errors).to have_key(:release_date)
    end
  end

    describe "association with artist" do
      let(:artist) { create :artist }

      it "belongs to an artist" do
        song = artist.songs.build(song_name: Faker::Lorem.sentence(3))

        expect(song.artist).to eq(artist)
      end
  end
end
