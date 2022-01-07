Rails.application.routes.draw do
  get 'users/show'
  devise_for :users
  resources :users
  get '/search', to:"posts#search"
  get 'favorites/update'
  get 'favorites/UpdateIndex'
  get 'comments/create'
  resources :posts do
    resources :comments
  end
  root "posts#index"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
