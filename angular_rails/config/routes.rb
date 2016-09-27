Rails.application.routes.draw do

  get "nba" => "static_pages#index"
  root 'users#index'
  # --------------- players routes --------------- #
  get "players" => "players#index"
  post "players" => "players#create"
  delete "players/:id" => "players#destroy"
  # --------------- teams routes --------------- #
  get "teams" => "teams#index"
  post "teams" => "teams#create"
  delete "teams/:id" => "teams#destroy"
# -------------- sessions routes --------------
  post "sessions" => "sessions#create"
  post "users" => "users#create"



end
