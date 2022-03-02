# == Schema Information
#
# Table name: users
#
#  id         :bigint           not null, primary key
#  username   :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class User < ApplicationRecord
    validates :username, presence: true, uniqueness: true

    has_many :artworks,
        class_name: "Artwork",
        primary_key: :id,
        foreign_key: :artist_id
        dependent: :destroy
        
    has_many :artwork_shares,
        class_name: "ArtworkShare",
        primary_key: :id,
        foreign_key: :viewer_id
        dependent: :destroy

    has_many :shared_viewers,
        through: :artwork_share,
        source: :artwork
end
