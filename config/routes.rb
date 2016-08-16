Rails.application.routes.draw do

  devise_for :users, path_names: { sign_up: '' }

  root to: "events#index"
  get '/about_us', to: 'events#about_us'
  get '/events/:id', to: 'events#show', as: 'event'

  namespace :admin do
    root to: "events#index"
    get '/members/export', to: 'members#export'
    post '/members/import', to: 'members#import'
    resources :events
    resources :members
  end

end
