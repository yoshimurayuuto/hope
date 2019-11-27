Rails.application.routes.draw do
  # この記述を変更
  root :to => 'oauth_test#index'
  devise_for :users, controllers: {
    registrations: "users/registrations",
    # この記述を追記
    omniauth_callbacks: "users/omniauth_callbacks"
  }
  resources :relationships, only: [:create, :destroy]
  resources :users, only: [:index, :new, :show]
  resources :conversations do
    resources :messages
  end
  resources :shares
end
