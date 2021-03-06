Rails.application.routes.draw do
  devise_for :users, :controllers => { :registrations => "user/registrations" }
  resources :user_stocks, except: [:show, :edit, :update]
  resources :users, only: [:show]
  resources :friendships
  
  get 'my_portfolio', to: "users#my_portfolio"
  get 'search_stocks', to: 'stocks#search'
  get 'my_friends', to: 'users#my_friends'
  get 'search_friends', to: 'users#search'
  post 'add_friend', to: 'users#add_friend'
  

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
