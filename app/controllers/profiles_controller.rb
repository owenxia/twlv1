class ProfilesController < ApplicationController
	before_action :authenticate_user!
	before_action :set_profile, except: [:index]

	def index
		@profiles = Profile.all.order('CREATED_AT DESC')
	end

	def show
		@hash_travel_records = Gmaps4rails.build_markers(@profile.user.travel_records) do |travel_record, marker|
			marker.lat travel_record.latitude
			marker.lng travel_record.longitude
		end
	end

	def new

	end

	def create

	end

	def edit
		
	end

	def update
		@temp = profile_params
		@temp[:city].downcase!
		@temp[:city] = @temp[:city].split(' ').map(&:capitalize).join(' ')
		@temp[:firstname].downcase!
		@temp[:firstname].capitalize!
		@temp[:lastname].downcase!
		@temp[:lastname].capitalize!


		if @profile.update(@temp)
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
