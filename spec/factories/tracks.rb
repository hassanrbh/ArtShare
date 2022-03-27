FactoryBot.define do
  factory :track do
    title { Faker::Music.album }
    ord { Faker::Number.digit }
    lyrics { Faker::Music.instrument }
    album_id { 5 }
  end
end
