Rails.application.routes.draw do
  get 'comments/create'
  resources :posts do
    resources :comments
  end
  root "posts#index"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
