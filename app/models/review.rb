class Review < ActiveRecord::Base
  belongs_to :experience
  belongs_to :user

  def set_user(id)
  	User.find(id)
  end
end
