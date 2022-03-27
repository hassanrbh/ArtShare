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
require 'rails_helper'

RSpec.describe Album, type: :model do
  describe "#validations" do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:band_id) }
    it { should validate_presence_of(:live) }
    it { should validate_inclusion_of(:live).in_array(%w[f t])}
    it { validate_presence_of(:year) }
  end
  describe "#associations" do
    it { should have_many(:tags) }
    it { should have_many(:tracks) }
    it { should belong_to(:band) }
  end
end
