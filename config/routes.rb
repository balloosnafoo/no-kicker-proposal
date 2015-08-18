Rails.application.routes.draw do
  root :to => "static_pages#home"

  resources :users
  resource :session, only: [:new, :create, :destroy]

  namespace :api, defaults: { format: :json } do
    resources :leagues
    resources :teams
    resources :score_rules, only: [:edit, :update]
    resources :roster_rules, only: [:edit, :update]
    resources :roster_slots, only: [:update]
    resources :players, only: [:index, :show]
    resources :player_contracts, only: [:create, :destroy]
    resources :matchups, only: [:create, :index]
    resources :messages, only: [:create, :index]
  end
end
