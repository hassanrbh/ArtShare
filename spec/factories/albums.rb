# == Schema Information
#
# Table name: albums
#
#  id         :bigint           not null, primary key
#  name       :string           not null
#  band_id    :integer          not null
#  live       :string(1)        default("f"), not null
#  year       :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
FactoryBot.define do
  factory :album do
    name { Faker::Name.first_name }
    band_id { rand(1..5) }
    year { 1990 }
  end
end
