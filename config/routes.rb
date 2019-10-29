Rails.application.routes.draw do
  get 'home/index'
  devise_for :users
  resources :memos
  post 'memos/:id/add', to: 'memos#add'
  post 'memos/:id/maina', to: 'memos#maina'
  post 'memos/:id/plus', to: 'memos#plus'
  root "home#index"
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

