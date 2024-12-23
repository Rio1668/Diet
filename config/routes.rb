Rails.application.routes.draw do
 
  devise_for :users, controllers: {
    registrations: 'public/users/registrations',
    sessions: 'public/users/sessions'
  }
  
  devise_for :admins, path: 'admin', controllers: {
    sessions: 'admin/admins/sessions'
  }

  scope module: :public do
    root 'homes#top'
    get "/home/about", to: "homes#about", as: "about"

    resources :users, only: [:show, :index, :edit, :update, :destroy]
    get 'mypage', to: 'users#mypage'
    post 'guest_log_in', to: 'users#guest_log_in'

    resources :groups do
      resource :group_users, only: [:create, :destroy]
      resources :comments, only: [:create]
    end
    resources :comments, only: [:destroy]

    resources :posts
  end
  
  namespace :admin do
    root 'users#index'
    resources :users, only: [:index, :show, :destroy]
    resources :comments, only: [:index, :destroy]
  end
end
