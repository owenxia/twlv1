# == Schema Information
#
# Table name: experiences
#
#  id                 :integer          not null, primary key
#  name               :string
#  continent          :string
#  country            :string
#  city               :string
#  description        :text
#  external_links     :text
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  latitude           :float
#  longitude          :float
#  location           :string
#  multimedia         :text
#  cover_file_name    :string
#  cover_content_type :string
#  cover_file_size    :integer
#  cover_updated_at   :datetime
#

require 'test_helper'

class ExperienceTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
