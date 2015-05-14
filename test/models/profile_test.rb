# == Schema Information
#
# Table name: profiles
#
#  id         :integer          not null, primary key
#  firstname  :string
#  lastname   :string
#  country    :string
#  gender     :string
#  age        :integer
#  about      :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :integer
#  city       :string
#  avatar_url :string
#  slug       :string
#

require 'test_helper'

class ProfileTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
