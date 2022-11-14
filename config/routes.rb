Rails.application.routes.draw do
  resources :users
  resources :groups do
    resources :establishments  
  end
  # root "articles#index"
  root 'splash_screen#index'
end
