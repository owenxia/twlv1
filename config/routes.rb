Rails.application.routes.draw do

  devise_for :users
  root 'welcome#index'

  get '/travel-inspirations', to: 'welcome#inspirations'
  get '/how-it-works', to: 'welcome#how_it_works'
  get '/my-wish-list', to: 'welcome#my_wish_list'

  resources :profiles do
    member do
	    get :follow
	    get :unfollow
	end
  end

  resources :experiences do
      member do
    	put "like", to: "experiences#add"
    	put "dislike", to: "experiences#remove"
    end
  end

  resources :travel_records
end
