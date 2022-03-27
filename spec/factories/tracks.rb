# == Schema Information
#
# Table name: tracks
#
#  id         :bigint           not null, primary key
#  album_id   :integer          not null
#  title      :text             not null
#  ord        :integer          not null
#  lyrics     :text
#  track_type :string           default("regular"), not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :integer
#
FactoryBot.define do
  factory :track do
    title { Faker::Music.album }
    ord { Faker::Number.digit }
    lyrics { Faker::Music.instrument }
    album_id { 5 }
  end
end
