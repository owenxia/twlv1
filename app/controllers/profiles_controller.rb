class ProfilesController < ApplicationController
	before_action :authenticate_user!
	before_action :set_profile

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

	private
	def profile_params
		params.require(:profile).permit(:firstname, :lastname, :location, :gender, :age, :about)
	end
	def set_profile
		@profile = current_user.profile
	end

end
