Rails.application.routes.draw do
  resource :groups do
    member do
  post 'remittance_out'
    end
  end

  get 'home/index'
  devise_for :users, :controllers => {
    :registrations => 'users/registrations'
  }

  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
    root :to => "devise/sessions#new"
  end

  resources :memos
  post 'memos/:id/remittance', to: 'memos#remittance'
  post 'memos/:id/tasuhiku', to: 'memos#tasuhiku'
  get 'users', to:'users#index'
  get 'soundboards', to:'soundboards#new'
  post 'soundboards' => 'soundboards#create'
  get 'groups/sanka'
  post 'groups/sanka2'
  get 'groups/taikai'
  get 'logs', to:'logs#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

