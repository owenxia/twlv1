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
#

class Review < ActiveRecord::Base
  belongs_to :experience
  belongs_to :user

  def set_user(id)
  	User.find(id)
  end
end
