Rails.application.routes.draw do
  get 'home/index'
  devise_for :users, :controllers => {
    :registrations => 'users/registrations'
  }
  resources :memos
  post 'memos/:id/hiku', to: 'memos#hiku'
  post 'memos/:id/plus', to: 'memos#plus'
  root "home#index"
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

