# == Schema Information
#
# Table name: artworks
#
#  id         :bigint           not null, primary key
#  title      :string           not null
#  image_url  :string           not null
#  artist_id  :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Artwork < ApplicationRecord
    validates :title, presence: true, uniqueness: {
        scope: :artist_id,
        message: "is already in the db"
    }
    validates :image_url, presence: true
    validates :artist_id, presence: true

    belongs_to :artist,
        class_name: "User",
        primary_key: :id,
        foreign_key: :artist_id,
        dependent: :destroy
    
    has_many :artwork_share,
        class_name: "ArtworkShare",
        primary_key: :id,
        foreign_key: :artwork_id,
        dependent: :destroy

    has_many :shared_viewers,
        through: :artwork_share,
        source: :viewer
end
