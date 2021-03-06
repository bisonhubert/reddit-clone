Rails.application.routes.draw do
  root    'posts#index'

  get     '/signup',  to: 'users#new'
  get     '/login',   to: 'sessions#new'
  post    '/login',   to: 'sessions#create'
  delete  '/logout',  to: 'sessions#destroy'
  
  resources :users, except: :index do
    resources :posts
  end

  resources :posts do
    resources :comments
  end
end
