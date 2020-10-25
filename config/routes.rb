# frozen_string_literal: true

Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'pages#home'

  resources :profiles
  resources :folders, except: [:show]

  get '/loadProfile', to: 'pages#home', constraints: { format: 'html' }
  get '/createProfile', to: 'pages#home', constraints: { format: 'html' }
  get '/folders/:id', to: 'pages#home', constraints: { format: 'html' }
  get '/files/:id', to: 'pages#home', constraints: { format: 'html' }
  get '/gasket', to: 'pages#home', constraints: { format: 'html' }

end
