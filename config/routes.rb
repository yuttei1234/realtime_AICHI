Rails.application.routes.draw do

   #以下、4〜11行目はadmin(管理者)関連のルーティング設定

  namespace :admins do
    get '/', to: 'homes#top'
    get '/users', to: 'users#index'

    resources :users, only: [:show, :edit, :update]
    resources :contacts, only: [:index, :show]
  end

   #以下、admin(管理者)とpublic(会員)ルーティングを分岐。

  devise_for :users, module: "users"
  devise_for :admins, module: "admins"

  devise_scope :user do
    root "users/sessions#new"
  end

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

  resources :recommendations, only: [:index]
  resources :contacts, only: [:new, :create]
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

end