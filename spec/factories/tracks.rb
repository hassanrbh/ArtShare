FactoryBot.define do
  factory :track do
    title { Faker::Music.album }
    ord {  5 }
    lyrics { Faker::Music.instrument }
    album_id { 5 }
  end
end
