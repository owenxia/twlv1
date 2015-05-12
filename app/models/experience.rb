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
	has_many :reviews, dependent: :destroy

	validates :name, presence: true

	acts_as_taggable
	acts_as_votable

	def tag_list
		tags.join(', ')
	end

	geocoded_by :location
	after_validation :geocode, if: :location_changed?

	searchkick

end
