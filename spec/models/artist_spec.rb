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
end
