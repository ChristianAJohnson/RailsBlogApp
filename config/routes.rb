Rails.application.routes.draw do
  # get 'comments/index'
  # get 'comments/new'
  # get 'comments/edit'
  # get 'comments/show'
  # get 'posts/index'
  # get 'posts/new'
  # get 'posts/edit'
  # get 'posts/show'
  # get 'users/show'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'welcome#index'

  get"/users/profile" => "users#show"

  devise_for :users

  resources :posts
  resources :comments


 

end
