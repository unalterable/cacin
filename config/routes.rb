Rails.application.routes.draw do
  
  get '/events', to: 'events#index'
  get '/events/:id', to: 'events#show'
  
  namespace :admin do
    resources :events
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
