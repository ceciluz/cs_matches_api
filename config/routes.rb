# frozen_string_literal: true

Rails.application.routes.draw do
  get 'players/create'
  get 'players/update'
  get 'players/destroy'
  get 'players/index'
  get 'players/show'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :matches, only: [:create]
  resources :players, only: [:create, :update, :destroy, :index, :show]
end
