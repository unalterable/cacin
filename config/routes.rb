Rails.application.routes.draw do

  get '/events', to: 'events#index'
  get '/events/:id', to: 'events#show', as: 'event'

  namespace :admin do
    resources :events
    resources :members
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
