Rdaily::Application.routes.draw do
  root to: "posts#index"

  get "/feed" => "posts#feed", :as => :feed, :defaults => { format: "atom" }
  get "/login" => "account/sessions#new"
  get "/logout" => "account/sessions#destroy"

  resources :posts, only: [:show]
  resources :pages, only: [:show]
  resources :categories, only: [:show]

  namespace :account do
    get "/" => :index
    resources :users, only: [:new, :create]
    resources :sessions, only: [:new, :create] do
      collection do
        delete :destroy
      end
    end
    resources :posts do
      member do
        post :publish
        post :unpublish
      end
    end
    resources :pages do
      member do
        post :publish
        post :unpublish
      end
    end
    resources :categories do
      collection do
        get :cancel
      end
    end
    resources :photos
  end

  if Rails.env.production?
    get "404", to: "application#page_not_found"
    get "422", to: "application#server_error"
    get "500", to: "application#server_error"
  end
end
