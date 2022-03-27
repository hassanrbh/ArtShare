# frozen_string_literal: true

# == Schema Information
#
# Table name: tracks
#
#  id         :bigint           not null, primary key
#  album_id   :integer          not null
#  title      :text             not null
#  ord        :integer          not null
#  lyrics     :text
#  track_type :string           default("regular"), not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :integer
#
class Track < ApplicationRecord
  TRACK_TYPES = %w[regular bonus].freeze

  validates :lyrics, presence: true
  validates :album_id, presence: true
  validates :title, presence: true
  validates :ord, presence: true
  validates :track_type, presence: true, inclusion: {
    in: TRACK_TYPES,
    message: 'Track Type must be in the list'
  }
  validates :user_id, presence: true

  has_many :tags, as: :tageable
  belongs_to :album, class_name: 'Album', dependent: :destroy
  has_many :notes, class_name: 'Note'
  belongs_to :user

  def get_breaker_lyrics
    break_lyrics = lyrics.split("\n")
    break_lyrics.each do |string_lyric|
      string_lyric
    end
  end
end
