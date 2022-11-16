# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  root 'splash_screen#index'
  resources :users, only: %i[ create update destroy]
  resources :groups do
    resources :establishments
  end
  # root "articles#index"
end
