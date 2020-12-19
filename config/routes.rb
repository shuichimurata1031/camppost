Rails.application.routes.draw do
  root to: 'toppages#index'
  
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  
  get 'signup', to: 'users#new'
  resources :users, only: [:index, :show, :new, :create] do #ログインユーザがユーザをフォロー／アンフォローするための
    #フォロー中のユーザとフォローされているユーザ一覧ページを表示するためのルーティング
    member do
      get :followings
      get :followers
    end
  end
  
  get 'signup', to: 'users#new'
  resources :users, only: [:index, :show, :new, :create]
  resources :campposts, only: [:create, :edit, :update, :destroy]
end