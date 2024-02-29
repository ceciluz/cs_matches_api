# frozen_string_literal: true

Rails.application.routes.draw do
  get 'teams/create'
  get 'teams/update'
  get 'teams/destroy'
  get 'teams/index'
  get 'teams/show'
  get 'players/create'
  get 'players/update'
  get 'players/destroy'
  get 'players/index'
  get 'players/show'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :matches, only: [:create]
  resources :players, only: %i[create update destroy index show]
end
