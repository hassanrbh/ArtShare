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
require 'test_helper'

class NoteTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
