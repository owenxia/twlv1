class ProfilesController < ApplicationController
	before_action :authenticate_user!, except: [:wish_list]
	before_action :set_profile, except: [:index]

	def index
		@profiles = Profile.all.order('CREATED_AT DESC')
	end

	def show
		@hash_travel_records = Gmaps4rails.build_markers(@profile.user.travel_records) do |travel_record, marker|
			marker.lat travel_record.latitude
			marker.lng travel_record.longitude
			marker.infowindow "<div style='width:100%;height:100%;'>#{travel_record.country}</div>"
		end
	end

	def new

	end

	def create

	end

	def edit
		
	end

	def update
		authorize! :update, @profile
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
		@experiences = @profile.user.find_liked_items
		
		@hash_wish_list = Gmaps4rails.build_markers(@experiences) do |experience, marker|
			marker.lat experience.latitude
			marker.lng experience.longitude
			marker.infowindow "<div style='width:250px;height:100%;'><a href='#{experience.id}'>#{experience.name}</a></div>"
		end
	end

	private
	def profile_params
		params.require(:profile).permit(:firstname, :lastname, :country, :city, :gender, :age, :about, :tag_list, :avatar_url, :avatar_img)
	end
	def set_profile
		if params[:id] 
			@profile = Profile.find(params[:id])
		else
			@profile = current_user.profile if @profile.nil?
		end
	end



end
