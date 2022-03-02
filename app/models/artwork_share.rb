# == Schema Information
#
# Table name: artwork_shares
#
#  id         :bigint           not null, primary key
#  artwork_id :integer          not null
#  viewer_id  :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class ArtworkShare < ApplicationRecord
    validates :artwork_id, presence: true, uniqueness: {
        scope: :viewer_id,
        message: 'You cannot create An artwork for two users :)'
    }
    validates :viewer_id, presence: true

    has_many :viewer,
        class_name: 'User',
        primary_key: :id,
        foreign_key: :viewer_id
    
    has_many :artwork,
        class_name: 'Artwork',
        primary_key: :id,
        foreign_key: :artwork_id
end
