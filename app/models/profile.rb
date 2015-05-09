# == Schema Information
#
# Table name: profiles
#
#  id         :integer          not null, primary key
#  firstname  :string
#  lastname   :string
#  location   :string
#  gender     :string
#  age        :integer
#  about      :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  avatar     :attachment
#  user_id    :integer
#

class Profile < ActiveRecord::Base
	belongs_to :user

end
