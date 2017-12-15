Rails.application.routes.draw do
  root to: "articles#index"
  resources :articles do
    resources :comments
  end
  resources :users
  resource :session, only: [:new, :create, :destroy]
  get 'login' => "sessions#new", as: "login"
  get 'logout' => "sessions#destroy", as: "logout"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
