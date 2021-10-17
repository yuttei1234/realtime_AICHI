Rails.application.routes.draw do
  devise_for :users, module: "users"
  devise_for :admins, module: "admins"

  root 'homes#top'
  get 'homes/about' => 'public/homes#about'

  #以下、public(会員)関連のルーティング設定

  namespace :public do

  resources :users, only: [:show, :edit, :update]do
    collection do
      get 'unsubscribe'
      patch 'withdraw'
    end
  end

  resources :post_images, only: [:new, :create, :index, :show, :edit, :update, :destroy] do
    resource :favorites, only: [:create, :destroy]    
  resources :post_comments, only: [:create, :destroy]
  end
  
  resources :recommendation, only: [:index]  
  resources :contacts, only: [:new, :create]
  end
  
  #以下、admin(管理者)関連のルーティング設定

  namespace :admins do
  get '/', to: 'homes#top'
  
  resources :users, only: [:index, :show, :edit, :update]
  resources :contacts, only: [:index, :show]   

  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

end