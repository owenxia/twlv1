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

class TravelRecord < ActiveRecord::Base
 	belongs_to :user
 	validates :country, presence: true
end
