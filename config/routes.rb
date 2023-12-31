Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'items#index'
  resources :items, only: [:new, :create, :show, :edit, :update, :destroy] do
    resources :addresses, only: [:index, :create]
  end
end
