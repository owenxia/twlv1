class ReviewsController < ApplicationController
	before_action :authenticate_user!
	before_action :set_experience, only: [:show, :edit, :update, :destroy]	
	before_action :set_review, only: [:show, :edit, :update, :destroy]	

	def index

	end

	def show
		
	end
	
	def new
		
	end

	def create
		@experience = Experience.find(params[:experience_id])
		@review = Review.new(review_params)
		@review.experience_id = @experience.id
		@review.user_id = current_user.id

		if @review.save
			flash[:notice] = "Review created."
			redirect_to @experience
		else
			render 'experiences/show'
		end
	end

	def edit
		
	end

	def update
		if @review.update(review_params)
			flash[:notice] = "Review updated."
			redirect_to @experience
		else
			render 'edit'
		end
	end

	def destroy
		@review.destroy
		flash[:notice] = "Review deleted."
		redirect_to @experience
	end

	private
	def review_params
		params.require(:review).permit(:body)
	end
	def set_experience	
		@experience = Experience.find(params[:experience_id])
	end
	def set_review	
		@review = Review.find(params[:id])
	end
end
