Rails.application.routes.draw do
  get "comments/create"
  get "order_items/create"
  get "order_items/destroy"
  get "orders/new"
  get "orders/create"
  get "orders/show"
  get "flavors/index"
  get "flavors/show"
  devise_for :users

  devise_scope :user do
    get "/users/sign_out" => "devise/sessions#destroy"
  end

  root "flavors#index"
  resources :flavors, only: [ :index, :show ] do
    resources :comments, only: [ :create ]
  end

  resources :orders, only: [ :new, :create, :index, :show ] do
    resources :order_items, only: [ :create, :destroy ]
  end

  resources :flavors do
    resources :comments, only: [ :create ]
  end

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/*
  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  get "manifest" => "rails/pwa#manifest", as: :pwa_manifest

  # Defines the root path route ("/")
  # root "posts#index"
end
