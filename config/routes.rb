Rails.application.routes.draw do

  devise_for :users, path_names: { sign_up: '' }

  root to: "home#index"
  get '/about_us', to: 'home#about_us'

  namespace :admin do
    root to: "events#index"
    get '/members/export', to: 'members#export'
    post '/members/import', to: 'members#import'
    resources :events
    resources :members
    resources :invitations
  end

end
