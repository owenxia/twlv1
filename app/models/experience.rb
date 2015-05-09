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
#

class Experience < ActiveRecord::Base
	acts_as_taggable
end
