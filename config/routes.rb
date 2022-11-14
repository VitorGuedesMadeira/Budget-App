Rails.application.routes.draw do
  devise_for :users
  resources :users
  resources :groups do
    resources :establishments  
  end
  # root "articles#index"
  root 'splash_screen#index'
end
