require 'rails_helper'

RSpec.describe Track, type: :model do
  subject(:track) { FactoryBot.build(:track) }

  describe "#validations" do
    it { should validate_presence_of(:lyrics) }
    it { should validate_presence_of(:lyrics) }
    it { should validate_presence_of(:ord) }
    it { should validate_presence_of(:track_type) }
    it { should validate_presence_of(:album_id) }
    it "should verify that the track type is 'regular' when initial" do
      track = FactoryBot.build(:track)
      expect(track.track_type).to eq("regular")
    end
    it "fails if the track type is not 'regular' or 'bonus'" do
      tracking = Track.new(track_type: "non")
      tracking.save
      expect(tracking.errors[:track_type]).to include('Track Type must be in the list') 
    end
  end
  
  describe "#associations" do
    it { should have_many(:tags) }
    it { should have_many(:notes) }
    it { should belong_to(:album) }
    it { should belong_to(:user) }
  end
end
  