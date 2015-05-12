Rails.application.routes.draw do

  devise_for :users

  authenticated :user do
    root to: "experiences#index", as: :authenticated_root
  end

  root to: 'welcome#how_it_works'

  get '/travel-inspirations', to: 'welcome#inspirations'
  get '/how-it-works', to: 'welcome#how_it_works'
  match '/my-wish-list', to: 'welcome#my_wish_list', via: [:get]
  match '/wish-list', to: 'controller#wish_list', via: [:post]

  resources :profiles do
    resources :travel_records
    member do
	    get :follow
	    get :unfollow
      get :wish_list
	end
  end

  resources :experiences do
      resources :comments
      resources :reviews
      member do
    	put "like", to: "experiences#add"
    	put "dislike", to: "experiences#remove"
    end
  end
end
