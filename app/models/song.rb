class Song < ApplicationRecord
  belongs_to :artist, optional: true
  validates :song_name, presence: true
  validates :album_name, presence: true
  validates :release_date, presence: true

end
