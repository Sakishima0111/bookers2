Rails.application.routes.draw do
  devise_for :users
  resources :users, only: [:index, :show, :edit, :update]
  resources :books, only: [:create, :index, :show, :edit, :destroy, :update] 
  root to: 'homes#top'
  get 'home/about' => 'homes#about'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
