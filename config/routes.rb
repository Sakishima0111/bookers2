Rails.application.routes.draw do
  get 'users/edit'
  get 'users/show'
  get 'books/index'
  get 'books/show'
  root to: 'homes#top'
  get 'home/about' => 'homes#about'
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
