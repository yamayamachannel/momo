Rails.application.routes.draw do
  get 'groups/new'
  get 'groups/create'
  get 'groups/edit'
  get 'groups/update'
  get 'groups/destroy'
  get 'home/index'
  devise_for :users, :controllers => {
    :registrations => 'users/registrations'
  }
  resources :memos
  # post 'memos/:id/hiku', to: 'memos#hiku'
  # post 'memos/:id/plus', to: 'memos#plus'
  post 'memos/:id/tasuhiku', to: 'memos#tasuhiku'
  root "home#index"
  get 'users', to:'users#index'
  get 'soundboards', to:'soundboards#new'
  post 'soundboards' => 'soundboards#create'
  get 'groups/new', to:'groups#new'
  post 'groups/create', to:'groups#create'
  get 'groups/show'
  get 'groups/sanka'
  post 'groups/sanka2'
  get 'groups/taikai'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

