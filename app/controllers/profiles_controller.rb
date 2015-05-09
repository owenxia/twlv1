class ProfilesController < ApplicationController
	before_action :authenticate_user!, :set_profile

	def index

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
		if @profile.update(profile_params)
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

	private
	def profile_params
		params.require(:profile).permit(:firstname, :lastname, :location, :gender, :age, :about, :tag_list)
	end
	def set_profile
		@profile = Profile.find(params[:id])
	end

end
