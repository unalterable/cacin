Rails.application.routes.draw do

  devise_for :users
  root to: "events#index"

  get '/events', to: 'events#index'
  get '/events/:id', to: 'events#show', as: 'event'

  namespace :admin do
    root to: "events#index"
    resources :events
    resources :members
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
