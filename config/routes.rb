Rails.application.routes.draw do
  devise_for :users
  root 'application#home'
  get 'home', to: 'pages#home'
  resources :books
  resources :user_books, only: [:index, :create, :update]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
