Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
    
      # resources :memes

      post "/sessions" => "sessions#create"

      get '/users' => 'users#index'
      post '/users' => 'users#create'
      get '/users/:id' => 'users#show'
      patch '/users/:id' => 'users#update'
      delete '/users/:id' => 'users#destroy'

      get '/memes' => 'memes#index'
      post '/memes' => 'memes#create'
      get '/memes/:id' => 'memes#show'
      patch '/memes/:id' => 'memes#update'
      delete '/memes/:id' => 'memes#destroy'
    end 
  end
end
