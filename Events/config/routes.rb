Rails.application.routes.draw do

  get 'atendees/create'

    # sessions path
    get '/' => 'sessions#new'
    get '/sessions/new' => 'sessions#new'
    post '/sessions' => 'sessions#create'
    delete '/sessions' => 'sessions#destroy'

    # user paths
    post '/users' => 'users#create'
    get '/user/:id' => 'users#edit'
    patch 'users/:id' => 'users#update'

    # events paths
    get '/events' => 'events#index'
    post '/events' => 'events#create'
    get '/events/:id' => 'events#show'
    delete '/events/:id' => 'events#destroy'

    # attendee controller
    post '/attendees/:id' => 'atendees#create'
    delete '/attendees/:id' => 'atendees#destroy'


    # comment paths
    post '/comment' => 'comments#create'

  root :to => 'events#index'
end
