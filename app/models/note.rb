# frozen_string_literal: true

# == Schema Information
#
# Table name: notes
#
#  id         :bigint           not null, primary key
#  longnote   :text             not null
#  user_id    :integer          not null
#  track_id   :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Note < ApplicationRecord
  validates :longnote, presence: { message: 'Must be given please"' }
  validates :user_id, presence: true
  validates :track_id, presence: true

  belongs_to :user, class_name: 'User'
  belongs_to :track, class_name: 'Track'
end
