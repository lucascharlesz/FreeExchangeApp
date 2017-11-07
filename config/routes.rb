Rails.application.routes.draw do
  namespace :backoffice do
    resources :categories, except: [:show]
    get 'dashboard', to: 'dashboard#index'
  end

  namespace :site do
    get 'home/index'
  end

  devise_for :users
  
  root 'site/home#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
