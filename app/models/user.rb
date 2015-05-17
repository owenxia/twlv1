# == Schema Information
#
# Table name: users
#
#  id                      :integer          not null, primary key
#  email                   :string           default(""), not null
#  encrypted_password      :string           default(""), not null
#  reset_password_token    :string
#  reset_password_sent_at  :datetime
#  remember_created_at     :datetime
#  sign_in_count           :integer          default(0), not null
#  current_sign_in_at      :datetime
#  last_sign_in_at         :datetime
#  current_sign_in_ip      :string
#  last_sign_in_ip         :string
#  created_at              :datetime
#  updated_at              :datetime
#  role                    :string
#  provider                :string
#  uid                     :string
#  username                :string
#  confirmation_token      :string
#  confirmed_at            :datetime
#  confirmation_sent_at    :datetime
#  gradded                 :boolean
#  avatar_img_file_name    :string
#  avatar_img_content_type :string
#  avatar_img_file_size    :integer
#  avatar_img_updated_at   :datetime
#

class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :omniauthable,
         :recoverable, :rememberable, :trackable, :validatable#, :confirmable



  has_one :profile, dependent: :destroy
  has_many :travel_records, dependent: :destroy
  has_many :reviews, dependent: :destroy
  
  acts_as_voter

  def self.from_omniauth(auth)
  	#where(auth.slice(:provider, :uid)).first_or_create do |user|
  	where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
  			user.email = auth.info.email
        user.provider = auth.provider
  			user.uid = auth.uid
  			user.username = auth.info.nickname
        user.build_profile.avatar_url = auth.info.image
  	end
  end

  def self.new_with_session(params, session)
  	if session["devise.user_attributes"]
  		new(session["devise.user_attributes"], without_protection: true) do |user|
  			user.attributes = params
  			user.valid?
  		end
  	else
  		super
  	end
  end

  def password_required?
  	super && provider.blank?
  end

  def update_with_password(params, *options)
  	if encrypted_password.blank?
  		update_attributes(params, *options)
  	else
  		super
  	end
  	
  end

end
