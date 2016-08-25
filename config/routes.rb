Rails.application.routes.draw do

  devise_for :users, path_names: { sign_up: '' }

  root to: "home#index"
  get '/about_us', to: 'home#about_us'

  get '/rsvp', to: 'home#rsvp'
  patch '/rsvp_update/:id', to: 'home#rsvp_update', as: 'rsvp_update'

  namespace :admin do
    root to: "events#index"
    resources :events
    resources :invitations
    resources :members
    get '/members/export', to: 'members#export'
    post '/members/import', to: 'members#import'
  end

end
