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
#  multimedia     :text
#

class Experience < ActiveRecord::Base
	has_many :reviews, dependent: :destroy

	validates :name, presence: true

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

	def self.text_search(query)
		if query.present?
			rank = <<-RANK
				ts_rank(to_tsvector(name), plainto_tsquery(#{sanitize(query)})) +
				ts_rank(to_tsvector(description), plainto_tsquery(#{sanitize(query)}))
			RANK
			where("	name @@ :q or 
					continent @@ :q or
					country @@ :q or
					city @@ :q or
					location @@ :q or
					description @@ :q or
					multimedia @@ :q or 
					external_links @@ :q", 
					q: query).order("#{rank} DESC")
		else
			scoped
		end
	end

end
