# frozen_string_literal: true

Rails.application.routes.draw do
  resources :matches, only: [:create]
  resources :players, only: %i[create update destroy index show]
  resources :teams, only: [:create, :update, :destroy, :index, :show]
end
