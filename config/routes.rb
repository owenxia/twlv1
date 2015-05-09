Rails.application.routes.draw do

  devise_for :users
  root 'welcome#index'

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

end
