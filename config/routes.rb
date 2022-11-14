Rails.application.routes.draw do
  devise_for :users
  root 'splash_screen#index'
  resources :users
  resources :groups do
    resources :establishments  
  end
  # root "articles#index"
end
