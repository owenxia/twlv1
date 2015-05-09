# == Schema Information
#
# Table name: travel_records
#
#  id         :integer          not null, primary key
#  country    :string
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'test_helper'

class TravelRecordTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
