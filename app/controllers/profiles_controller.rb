class ProfilesController < ApplicationController
	before_action :authenticate_user!
	before_action :set_profile, except: [:index]

	def index
		@profiles = Profile.all.order('CREATED_AT DESC')
	end

	def show
	end

	def new

	end

	def create

	end

	def edit
		
	end

	def update
		profile_params[:city].downcase!
		profile_params[:city].capitalize!
		if @profile.update(profile_params)
			flash[:notice] = "Profile updated."
			redirect_to @profile
		else
			render 'edit'	
		end
	end

	def destroy

	end

	def follow
		current_user.profile.follow(@profile)
		redirect_to @profile
	end

	def unfollow
		current_user.profile.stop_following(@profile)
		redirect_to @profile

	end

	def wish_list
		
	end

	private
	def profile_params
		params.require(:profile).permit(:firstname, :lastname, :country, :city, :gender, :age, :about, :tag_list, :avatar_url)
	end
	def set_profile
		@profile = Profile.find(params[:id])
	end



end
