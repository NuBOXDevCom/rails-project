Rails.application.routes.draw do
  resources :posts
  resources :recipes
  get 'tasks/index'

  get 'tasks/new'

  namespace :api, defaults: {format: :json} do
    post 'authenticate', to: 'authentication#authenticate'
    get 'test', to: 'test#index'
  end

  resources :evolutions, except: [:show]
  resources :stanhome_products, except: [:show]
  resources :tasks
  resources :recipes

  devise_for :users, controllers: {
      omniauth_callbacks: 'users/omniauth_callbacks'
  }

  root 'home#index'
  get 'home/activate_api'
end
