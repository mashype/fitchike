Rails.application.routes.draw do

  resources :profiles do 
    resources :reviews, except: [:show, :index]
  end

  resources :genders
  
  resources :appointments

  resources :charges

  devise_for :users
  
  get 'welcome/index'
 
  authenticated :user do
  	root 'appointments#index', as: "authenticated_root"
  end

  root  'welcome#index'

end