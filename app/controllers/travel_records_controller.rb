class TravelRecordsController < ApplicationController
	before_action :authenticate_user!
	before_action :set_travel_record, only: [:show, :edit, :update, :destroy]

	def index
		@travel_records = TravelRecord.all.order('CREATED_AT DESC')

	end

	def show

	end

	def new
		@travel_record = current_user.travel_records.new
	end

	def create
		@travel_record = current_user.travel_records.new(travel_record_params)
		if @travel_record.save
			redirect_to @travel_record
		else
			render 'new'
		end
	end

	def edit
		
	end

	def update
		if @travel_record.update(travel_record_params)
			redirect_to @travel_record		
		else
			render 'edit'	
		end
	end

	def destroy
		@travel_record.destroy
		redirect_to travel_records_path
	end

	private
	def travel_record_params
		params.require(:travel_record).permit(:country)
	end
	def set_travel_record	
		@travel_record = TravelRecord.find(params[:id])
	end
end
