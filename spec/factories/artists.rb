FactoryGirl.define do
  factory :artist do
    name           { Faker::Lorem.sentence(5) }
    country        { Faker::Address.country }
    biography      { Faker::Lorem.characters(1000) }
    official_site  { Faker::Internet.url}
  end
end
