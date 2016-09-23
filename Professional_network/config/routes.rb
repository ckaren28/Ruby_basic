Rails.application.routes.draw do

  resources :invites

    # sessions path
    get '/main' => 'sessions#new'
    post '/main' => 'sessions#create'
    delete '/main' =>'sessions#destroy'

    # users path
    post '/users' => 'users#create'
    get '/professional_profile' => 'users#index'
    get '/users' => 'users#all'
    get '/users/:id' => 'users#show'

    # invites path
    post '/requests/:id' => 'friend_requests#create'
    post '/accept/:id' => 'friend_requests#update'
    delete '/requests/:id' => 'friend_requests#destroy'

end
