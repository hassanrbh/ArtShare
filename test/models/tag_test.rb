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
require "test_helper"

class TagTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
