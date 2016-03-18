Rails.application.routes.draw do

  resources :workout_types
  resources :profiles do 
    resources :reviews, except: [:show, :index]
  end

  
  
  resources :appointments do
    resources :confirmations
  end

  resources :charges
  resources :genders
  
  devise_for :users
  
  get 'welcome/index'
 
  authenticated :user do
  	root 'appointments#index', as: "authenticated_root"
  end

  root  'welcome#index'

end