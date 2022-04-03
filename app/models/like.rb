# == Schema Information
#
# Table name: likes
#
#  id         :bigint           not null, primary key
#  user_id    :integer          not null
#  note_id    :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Like < ApplicationRecord
    validates :user_id, uniqueness: {
        scope: :note_id,
        message: 'You cannot Like at the moment'
    }
    belongs_to :user
    belongs_to :note    
end
