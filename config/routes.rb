Rails.application.routes.draw do

  devise_for :users
  root 'welcome#index'

  resources :profiles do
    member do
	    get :follow
	    get :unfollow
	end
  end

  resources :experiences

end
