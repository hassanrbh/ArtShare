# == Schema Information
#
# Table name: bands
#
#  id         :bigint           not null, primary key
#  name       :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Band < ApplicationRecord
    validates :name, presence: true

    has_many :albums,
        class_name: 'Album',
        primary_key: :id,
        foreign_key: :band_id,
        dependent: :destroy

    def band_albums
        self.albums
    end
end
