Rails.application.routes.draw do
  devise_for :users
  resources :posts do
  	collection do
  		get :latest
  	end
  end
  resources :projects
  resources :contacts , only: [:new, :create]
  get 'welcome/index'
  root 'welcome#index'
end
