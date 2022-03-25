# frozen_string_literal: true

# == Schema Information
#
# Table name: tags
#
#  id            :bigint           not null, primary key
#  tag           :string           not null
#  tageable_type :string
#  tageable_id   :bigint
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#
class Tag < ApplicationRecord
  validates :tag, presence: true
  belongs_to :tageable, polymorphic: true
end
