Rails.application.routes.draw do
 devise_for :users, :path_prefix => 'd'
resources :users, :only => [:show]
  root to: 'pages#home'
  resources :gardens do
    resources :bookings, only: [:new, :create, :edit, :update]
  end
  resources :bookings, only: [:index, :show, :destroy]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
