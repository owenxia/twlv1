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

class Experience < ActiveRecord::Base
	has_many :reviews, dependent: :destroy

	validates :name, presence: true

	has_attached_file :cover, styles: {small: "400x300>", large: "800x600>"}
  	validates_attachment_content_type :cover, :content_type => /\Aimage\/.*\Z/


	acts_as_taggable
	acts_as_votable

	def tag_list
		tags.join(', ')
	end

	geocoded_by :full_location
	after_validation :geocode, if: :country_changed? 
	after_validation :geocode, if: :city_changed? 
	after_validation :geocode, if: :location_changed? 

	# searchkick

	def full_location
		"#{self.country} #{self.city} #{self.location}"
	end

	include PgSearch
	pg_search_scope :search, against: [:name, :continent, :country, :city, :location, :description, :multimedia, :external_links],
		using: {tsearch: {dictionary: "english"}}

	def self.text_search(query)
		search(query)
	end

end
