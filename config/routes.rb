Rails.application.routes.draw do
  get 'home/index'
  devise_for :users, :controllers => {
    :registrations => 'users/registrations'
  }
  resources :memos
  post 'memos/:id/hiku', to: 'memos#hiku'
  post 'memos/:id/plus', to: 'memos#plus'
  post 'memos/:id/tasuhiku', to: 'memos#tasuhiku'
  root "home#index"
  get 'users', to:'users#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

