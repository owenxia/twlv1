class ExperiencesController < ApplicationController
	include AutoHtml

	before_action :authenticate_user!, except: [:index]
	before_action :set_experience, only: [:show, :edit, :update, :destroy, :add, :remove]

	def index
		if params[:search]
			@experiences = Experience.text_search(params[:search]).page(params[:page]).per(5)
		elsif params[:tag]
			@experiences = Experience.tagged_with(params[:tag]).page(params[:page]).per(5)
		elsif params[:continent]
			@experiences = Experience.where("continent = ?", params[:continent]).page(params[:page]).per(5)
		elsif params[:country]
			@experiences = Experience.where("country = ?", params[:country]).page(params[:page]).per(5)
		elsif params[:city]
			@experiences = Experience.where("city = ?", params[:city]).page(params[:page]).per(5)
		else	
			# Kaminari
			@experiences = Experience.all.order('name').page(params[:page]).per(5)
			
			# Will_paginate
			# @experiences = Experience.all.paginate(page: params[:page], per_page:10)
		end

		@hash_experience_list = Gmaps4rails.build_markers(@experiences) do |experience, marker|
			marker.lat experience.latitude
			marker.lng experience.longitude
			marker.infowindow "<div style='width:250px;height:100%;'><a href='#{experience.id}'>#{experience.name}</a></div>"
		end

	end

	def show
		@hash_experience = Gmaps4rails.build_markers(@experience) do |experience, marker|
			marker.lat experience.latitude
			marker.lng experience.longitude
			marker.infowindow "<div style='width:250px;height:100%;'><a href='#{experience.id}'>#{experience.name}</a></div>"
		end

		@review = @experience.reviews.new
		
	end

	def new
		@experience = Experience.new
	end

	def create
		authorize! :create, @experience

		set_params

		@experience = Experience.new(@temp)
		
		if @experience.save
			redirect_to @experience
		else
			render 'new'
		end
	end

	def edit
		
	end

	def update
		authorize! :update, @experience

		set_params

		if @experience.update(@temp)
			flash[:notice] = "Experience updated."
			redirect_to @experience		
		else
			render 'edit'	
		end
	end

	def destroy
		authorize! :destroy, @experience
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
		params.require(:experience).permit(:name, :continent, :country, :city, :location, :description, :multimedia, :external_links, :tag_list)
	end
	def set_experience		
		@experience = Experience.find(params[:id])
	end
	def set_params
		@temp = experience_params
		@temp[:name].downcase!
		@temp[:name] = @temp[:name].split(' ').map(&:capitalize).join(' ')
		@temp[:city].downcase!
		@temp[:city] = @temp[:city].split(' ').map(&:capitalize).join(' ')
		@temp[:location].downcase!
		@temp[:location] = @temp[:location].split(' ').map(&:capitalize).join(' ')
		if @temp[:location].empty?
			@temp[:location] = @temp[:city]
		end
		@temp[:description] = auto_html(@temp[:description]){ simple_format; link(:target => 'blank') }
		@temp[:description] = @temp[:description][3..(@temp[:description].length-5)] if !@temp[:description].empty?
		@temp[:multimedia] = (auto_html(@temp[:multimedia]){ simple_format; link(:target => 'blank') })
		@temp[:multimedia] = @temp[:multimedia][3..(@temp[:multimedia].length-5)] if !@temp[:multimedia].empty?
		@temp[:external_links] = auto_html(@temp[:external_links]){ simple_format; link(:target => 'blank') }
		@temp[:external_links] = @temp[:external_links][3..(@temp[:external_links].length-5)] if !@temp[:external_links].empty?
	end

end
