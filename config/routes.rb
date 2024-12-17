Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'public/users/registrations',
    sessions: 'public/users/sessions'
  }
  
  scope module: :public do
    root 'homes#top'
    get "/home/about", to: "homes#about", as: "about"
    resources :posts
    get 'mypage', to: 'users#mypage'
  end
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
