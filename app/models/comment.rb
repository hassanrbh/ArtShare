# == Schema Information
#
# Table name: comments
#
#  id         :bigint           not null, primary key
#  author_id  :integer          not null
#  post_id    :integer          not null
#  body       :text             not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Comment < ApplicationRecord

    # ! User : A Comment can belongs_to a user
    belongs_to :user,
        class_name: 'User',
        primary_key: :id,
        foreign_key: :author_id,
        dependent: :destroy 
    
    # ! Artwrok : A Comment can belongs_to an artwork
    belongs_to :artwork,
        class_name: 'Artwork',
        primary_key: :id,
        foreign_key: :post_id,
        dependent: :destroy
    
end
