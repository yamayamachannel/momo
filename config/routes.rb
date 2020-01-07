Rails.application.routes.draw do
  resource :groups
  get 'home/index'
  devise_for :users, :controllers => {
    :registrations => 'users/registrations'
  }
  resources :memos
  post 'memos/:id/hiku', to: 'memos#hiku'
  post 'memos/:id/tasu', to: 'memos#tasu'
  post 'memos/:id/remittance', to: 'memos#remittance'
  post 'memos/:id/tasuhiku', to: 'memos#tasuhiku'
  root "home#index"
  get 'users', to:'users#index'
  get 'soundboards', to:'soundboards#new'
  post 'soundboards' => 'soundboards#create'
  get 'groups/sanka'
  post 'groups/sanka2'
  get 'groups/taikai'
  get 'logs', to:'logs#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

