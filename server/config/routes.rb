Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get '/posts/create', to: 'posts#new'
  resources :users
  resources :posts
  post '/login', to: 'users#login'
  post '/logout', to: 'users#logout'
  root to: 'users#index'
  get '/user', to: 'users#auto_login'
  get '/profile', to: 'users#edit'
  get '/posts/edit/:id', to: 'posts#edit'
  post '/users/change_password', to: 'users#change_password'
end
