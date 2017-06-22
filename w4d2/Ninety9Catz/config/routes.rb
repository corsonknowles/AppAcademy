Rails.application.routes.draw do
  # get 'cats_rental/create'
  #
  # get 'cats_rental/edit'
  #
  # get 'cats_rental/index'
  #
  # get 'cats_rental/show'
  #
  # get 'cats_rental/new'
  #
  # get 'cats_rental/update'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :cats

  resources :cat_rentals

end
