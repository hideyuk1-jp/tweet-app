Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/' => 'home#top'
  get '/posts/index' => 'posts#index'
  post '/posts/search' => 'posts#index'
  post '/posts/create' => 'posts#create'
  get '/posts/:id' => 'posts#show'
  get '/posts/:id/edit' => 'posts#edit'
  post '/posts/:id/update' => 'posts#update'
  get '/posts/:id/destroy' => 'posts#destroy'

  get '/users/signup' => 'users#new'
  post '/users/create' => 'users#create'
  get '/users/index' => 'users#index'
  get '/users/:id/edit' => 'users#edit'
  post '/users/:id/update' => 'users#update'
  get '/users/:id' => 'users#show'
end
