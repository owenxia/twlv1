# == Schema Information
#
# Table name: profiles
#
#  id                      :integer          not null, primary key
#  firstname               :string
#  lastname                :string
#  country                 :string
#  gender                  :string
#  age                     :integer
#  about                   :text
#  created_at              :datetime         not null
#  updated_at              :datetime         not null
#  user_id                 :integer
#  city                    :string
#  avatar_url              :string
#  avatar_img_file_name    :string
#  avatar_img_content_type :string
#  avatar_img_file_size    :integer
#  avatar_img_updated_at   :datetime
#

require 'test_helper'

class ProfileTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
