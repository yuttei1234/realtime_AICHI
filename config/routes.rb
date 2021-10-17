Rails.application.routes.draw do
  devise_for :users, module: "users"
  devise_for :admins, module: "admins"

  root 'homes#top'
  get 'homes/about' => 'users/homes#about'

  namespace :users do
  end

  namespace :admins do
  get '/', to: 'homes#top'
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end