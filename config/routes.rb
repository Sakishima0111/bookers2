Rails.application.routes.draw do
  resources :users, only: [:index, :show, :edit, :update]
  resources :books, only: [:create, :index, :show, :edit, :destroy] 
  root to: 'homes#top'
  get 'home/about' => 'homes#about'
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
