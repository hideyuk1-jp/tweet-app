Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/' => 'home#top'
  get '/posts/index' => 'posts#index'
  post '/posts/search' => 'posts#index'
  get '/posts/new' => 'posts#new'
  post '/posts/create' => 'posts#create'
  get '/posts/:id' => 'posts#show'
  get '/posts/:id/edit' => 'posts#edit'
  post '/posts/:id/update' => 'posts#update'
  get '/posts/:id/destroy' => 'posts#destroy'
end
