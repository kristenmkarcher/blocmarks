Rails.application.routes.draw do
  get 'users/show'

  get 'welcome/index'
  get 'welcome/about'
  root 'welcome#index'

  devise_for :users

  get 'users/show'
  get 'likes/index'
  post :incoming, to:'incoming#create'

  resources :users, only: [:show] do
    resources :items, only: [:create, :destroy]
  end

  resources :topics do
    resources :bookmarks, except: :index
  end

  resources :bookmarks do
    resources :likes, only: [:index, :create, :destroy]
  end

end
