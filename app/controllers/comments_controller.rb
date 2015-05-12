class CommentsController < ApplicationController
	before_action :authenticate_user!, except: [:index, :show]
	before_action :set_comment, only: [:show, :edit, :update, :destroy]	

	def index

	end

	def show
		
	end
	
	def new
		
	end

	def create
		# @experience = Experience.find(params[:experience_id])
		# @comment_body = comment_params[:body]
		# @comment = Comment.build_from(@experience, current_user.id, @comment_body)

		@experience = Experience.find(params[:experience_id])
		@comment = Comment.new(comment_params)
		@comment.experience_id = @experience.id
		@comment.user_id = current_user.id

		if @comment.save
			flash[:notice] = "Comment created."
			redirect_to @experience
		else
			render 'new'
		end
	end

	def edit
		
	end

	def update
	end

	def destroy
		
	end

	private
	def comment_params
		params.require(:comment).permit(:body)
	end
	def set_comment	
		@comment = Comment.find(params[:id])
	end
end
