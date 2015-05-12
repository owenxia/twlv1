class TravelRecordsController < ApplicationController
	before_action :authenticate_user!
	before_action :set_profile_and_travel_record, only: [:show, :edit, :update, :destroy]

	def index
		@travel_records = TravelRecord.all.order('CREATED_AT DESC')

	end

	def show

	end

	def new
		@profile = Profile.find(params[:profile_id])
		@travel_record = @profile.user.travel_records.new
	end

	def create
		@profile = Profile.find(params[:profile_id])
		@new_country = travel_record_params[:country]
		@@to_create = true;
		@profile.user.travel_records.each do |travel_record|
			if travel_record.country == @new_country
				flash[:alert] = "Travel record not created. You've already been there."
				@@to_create = false;
			end
		end
		if @@to_create
			@travel_record = @profile.user.travel_records.new(travel_record_params)

			authorize! :create, @travel_record

			if @travel_record.save
				flash[:notice] = "New travel record created."
				redirect_to @profile
			else
				render 'new'
			end
		else
			redirect_to @profile
		end
	end

	def edit
		
	end

	def update
		authorize! :update, @travel_record
		if @travel_record.update(travel_record_params)
			redirect_to @travel_record		
		else
			render 'edit'	
		end
	end

	def destroy
		authorize! :destroy, @travel_record
		@travel_record.destroy
		redirect_to @profile
	end

	private
	def travel_record_params
		params.require(:travel_record).permit(:country)
	end
	def set_profile_and_travel_record	
		@profile = Profile.find(params[:profile_id])
		@travel_record = TravelRecord.find(params[:id])
	end
end
