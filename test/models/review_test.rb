# == Schema Information
#
# Table name: reviews
#
#  id            :integer          not null, primary key
#  body          :text
#  experience_id :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  user_id       :integer
#  slug          :string
#

require 'test_helper'

class ReviewTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
