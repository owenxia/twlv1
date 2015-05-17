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
#

class Profile < ActiveRecord::Base
	belongs_to :user

	has_attached_file :avatar_img, :styles => { :standard => "300x300>" }, :default_url => :avatar_url
  	validates_attachment_content_type :avatar_img, :content_type => /\Aimage\/.*\Z/
	
	acts_as_taggable
	acts_as_followable
	acts_as_follower

	def tag_list
    	tags.join(', ')
  	end

end
