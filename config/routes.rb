Rails.application.routes.draw do
  root to: 'artists#index'

  devise_for :users

  resources :artists do
    resources :songs
  end

  namespace :api do
    resources :songs
  end

  namespace :api do
    resources :artists

  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
