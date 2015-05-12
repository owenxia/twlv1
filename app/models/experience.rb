# == Schema Information
#
# Table name: experiences
#
#  id             :integer          not null, primary key
#  name           :string
#  continent      :string
#  country        :string
#  city           :string
#  description    :text
#  external_links :text
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  latitude       :float
#  longitude      :float
#  location       :string
#

class Experience < ActiveRecord::Base
	acts_as_taggable
	acts_as_votable

	has_many :comments, dependent: :destroy
	has_many :reviews, dependent: :destroy

	validates :name, presence: true

	def tag_list
	tags.join(', ')
	end

	geocoded_by :location
	after_validation :geocode, if: :location_changed?
end
