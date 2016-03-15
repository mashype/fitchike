Rails.application.routes.draw do
  devise_for :users
  get 'welcome/index'
  resources :appointments

  authenticated :user do
  	root 'appointments#index', as: "authenticated_root"
  end

  root  'welcome#index'

end
