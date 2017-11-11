class Artist < ApplicationRecord
   has_many :songs, dependent: :destroy
   has_many :photos
   validates :name, presence: true
   validates :country, presence: true
   validates :biography, presence: true, length: { maximum: 1000 }
   validates :official_site, presence: true
end
