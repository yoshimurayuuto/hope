Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  # この記述を変更
  root :to => 'oauth_test#index'
  devise_for :users, controllers: {
    registrations: "users/registrations",
    # この記述を追記
    omniauth_callbacks: "users/omniauth_callbacks"
  }
  devise_scope :user do
    get 'confirm_email', to: 'users/registrations#confirm_email'
  end
  resources :relationships, only: [:create, :destroy]
  resources :users, only: [:index, :new, :show]
  resources :conversations do
    resources :messages
  end
  resources :shares do
    resources :comments
  end
  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end
end
