class ExperiencesController < ApplicationController
	before_action :authenticate_user!, except: [:index]
	before_action :set_experience, only: [:show, :edit, :update, :destroy, :add, :remove]

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
			flash[:notice] = "Experience updated."
			redirect_to @experience		
		else
			render 'edit'	
		end
	end

	def destroy
		@experience.destroy
		redirect_to experiences_path
	end

	def add
		@experience.upvote_by current_user
		redirect_to :back
	end

	def remove
		@experience.downvote_by current_user
		redirect_to :back
	end

	private
	def experience_params
		params.require(:experience).permit(:name, :continent, :country, :city, :location, :description, :external_links, :tag_list)
	end
	def set_experience		
		@experience = Experience.find(params[:id])
	end

end
