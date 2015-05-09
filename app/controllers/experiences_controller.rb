class ExperiencesController < ApplicationController
	before_action :authenticate_user!
	before_action :set_experience, only: [:show, :edit, :update, :destroy]

	def index
		@experiences = Experience.all.order('CREATED_AT DESC')

	end

	def show

	end

	def new
		@experience = Experience.new
	end

	def create
		@experience = Experience.new(experience_params)
		@experience.city.downcase!
		if @experience.save
			redirect_to @experience
		else
			render 'new'
		end
	end

	def edit
		
	end

	def update
		if @experience.update(experience_params)
			redirect_to @experience		
		else
			render 'edit'	
		end
	end

	def destroy
		@experience.destroy
		redirect_to experiences_path
	end

	private
	def experience_params
		params.require(:experience).permit(:name, :continent, :country, :city, :description, :external_links)
	end
	def set_experience		
		@experience = Experience.find(params[:id])
		@experience.city.downcase!
	end
end
