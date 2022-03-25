# frozen_string_literal: true

# == Schema Information
#
# Table name: albums
#
#  id         :bigint           not null, primary key
#  name       :string           not null
#  band_id    :integer          not null
#  live       :string(1)        default("f"), not null
#  year       :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Album < ApplicationRecord
  LIVE_ALBUMS = %w[
    f
    t
  ].freeze

  validates :name, presence: true
  validates :band_id, presence: true
  validates :live, presence: true, inclusion: {
    in: LIVE_ALBUMS,
    message: 'Please Select the right live'
  }
  validates :year, presence: true

  has_many :tags, as: :tageable
  belongs_to :band,
             class_name: 'Band',
             primary_key: :id,
             foreign_key: :band_id,
             dependent: :destroy

  has_many :tracks, class_name: 'Track', dependent: :destroy
end
