FactoryGirl.define do
  factory :song do
    song_name         { Faker::Lorem.sentence(3) }
    album_name        { Faker::Lorem.sentence(3) }
    release_date      { Faker::Number.number(4) }
    artist            { build(:artist) }
  end
end
