Rails.application.routes.draw do
  get "users/show"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/*
  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  get "manifest" => "rails/pwa#manifest", as: :pwa_manifest

  # Defines the root path route ("/")
  root "yaku#index"

  get "auth/:provider/callback", to: "sessions#create"
  get "auth/failure", to: redirect("/")
  post "logout", to: "sessions#destroy", as: "logout"

  get "/terms", to: "static_pages#terms", as: :terms  # 利用規約
  get "/privacy", to: "static_pages#privacy", as: :privacy # プライバシーポリシー
  get "/help", to: "static_pages#help", as: :help # 使い方の説明

  resources :sessions, only: %i[create destroy]
  resource :battle_score, only: [ :show, :update ], controller: "users"
  resources :scores, only: [ :create ] do
    delete :destroy_group, on: :collection
  end
end
