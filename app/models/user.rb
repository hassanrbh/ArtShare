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

    # ! Artwork : For see all the artworks available
    has_many :artworks,
        class_name: "Artwork",
        primary_key: :id,
        foreign_key: :artist_id,
        dependent: :destroy

    # ! ArtworkShare : For artwork viewers
    has_many :artwork_shares,
        class_name: "ArtworkShare",
        primary_key: :id,
        foreign_key: :viewer_id,
        dependent: :destroy

    # ! Artwork : For Shared Viewers 
    has_many :shared_viewers,
        through: :artwork_share,
        source: :artwork

    # ! Comment : For The user comments
    has_many :comments,
        class_name: "Comment",
        primary_key: :id,
        foreign_key: :author_id,
        dependent: :destroy
    
    # ! Likes : For the user likes

    has_many :likes,
        class_name: 'Like',
        primary_key: :id,
        foreign_key: :user_id

    # * A polymorphic Association through likes and source is either one of comments or artwork

    has_many :likes_comments,
        through: :likes,
        source: :likeable,
        source_type: 'Comment'

    has_many :likes_artworks,
        through: :likes,
        source: :likeable,
        source_type: 'Artwork'
      
end
