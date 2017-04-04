Rails.application.routes.draw do
  devise_for :users, :controllers => { :registrations => "user/registrations" }
  resources :user_stocks, except: [:show, :edit, :update]
 
  get 'my_portfolio', to: "users#my_portfolio"
  get 'search_stocks', to: 'stocks#search'
  
  resources :posts do
  	collection do
  		get :latest
  	end
  end
   
  resources :projects
  resources :contacts , only: [:new, :create]

  namespace :account do
    resources :posts
  end

  namespace :admin do
    resources :posts
  end
  
  get 'welcome/index'
  root 'welcome#index'
end
