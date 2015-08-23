Rails.application.routes.draw do
  root 'posts#index'
  resources :posts, only: [:index, :create, :delete]
end
