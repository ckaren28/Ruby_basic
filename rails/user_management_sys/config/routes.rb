Rails.application.routes.draw do
  get 'users/index'
  get 'users/new'
  post 'users/create'
  patch 'users/:id' => 'users#update'
  get 'users/:id' => 'users#show'
  get 'users/:id/edit' => 'users#edit'
  delete 'users/:id' => 'users#delete'

  root :to => 'users#index'


end
