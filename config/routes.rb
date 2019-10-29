Rails.application.routes.draw do
  get 'home/index'
  devise_for :users
  resources :memos
  get 'memos/:id/add', to: 'memos#add'
  root "home#index"
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

