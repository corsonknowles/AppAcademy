Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # resources :users
  # get 'users' => 'users#index'
  # get 'users/:id' => 'users#show', as: :user
  # post 'users' => 'users#create'
  # get 'users/new' => 'users#new', as: :new_user
  # get 'users/:id/edit' => 'users#edit', as: :edit_user
  # patch 'users/:id' => 'users#update'
  # put 'users/:id' => 'users#update'
  # delete 'users/:id' => 'users#destroy'

  resources :users, only: [:index, :show, :update, :destroy, :create]

  resources :artworks, only: [:index, :show, :update, :destroy, :create]

  resources :artwork_shares, only: [:destroy, :create]

  resources :users do
    resources :artworks, only: [:index]
  end

  resources :comments, only: [:create, :destroy, :index]

  resources :users do
    resources :comments, only: [:index]
  end

  resources :artworks do
    resources :comments, only: [:index]
  end
end
