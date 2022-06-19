Rails.application.routes.draw do

  namespace :public do
    get 'relationships/followings'
    get 'relationships/followers'
  end
  # 顧客用
  # devise_for :customers
  # URL /customers/sign_in ...
  devise_for :customers, skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }

  # 管理者用
  # devise_for :admins
  # URL /admin/sign_in ...
  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
    sessions: "admin/sessions"
  }
  

  scope module: :public do
    root to: 'homes#top'
    get "search" => "searches#search"

    resources :recipes, only: [:new, :create, :index, :show, :edit, :update, :destroy] do
      resource :favorites, only: [:create, :destroy]
      resources :comments, only: [:create, :destroy]
    end
    # 退会確認画面
    get '/customers/is_deleted' => 'customers#is_deleted'
    # 論理削除用のルーティング
    patch 'customers/:id/withdrawal' => 'customers#withdrawal', as: 'withdrawal'
    resources :customers, only: [:edit, :update]
    get '/customers/my_page' => 'customers#show'

    resource :relationships, only: [:create, :destroy]
    get 'followings' => 'relationships#followings', as: 'followings'
    get 'followers' => 'relationships#followers', as: 'followers'

  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end