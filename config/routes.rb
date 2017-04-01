Rails.application.routes.draw do
  devise_for :users
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
