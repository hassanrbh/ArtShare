# == Schema Information
#
# Table name: likes
#
#  id            :bigint           not null, primary key
#  user_id       :integer
#  likeable_type :string
#  likeable_id   :bigint
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#
class Like < ApplicationRecord
   validates :user_id, presence: true, uniqueness: {
       scope: [:likeable_type, :likeable_id ]
   }

   belongs_to :likeable, polymorphic: true
   belongs_to :users,
        class_name: 'User',
        primary_key: :id,
        foreign_key: :user_id
end
