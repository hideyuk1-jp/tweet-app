Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/' => 'home#top'
  get '/posts/index' => 'posts#index'
  get '/posts/:id' => 'posts#show'
end
