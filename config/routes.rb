Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "pages#home"
  resources :games do
    resources :bookings, only: [:new, :create, :destroy]
  end

  # resources :bookings, only: [:destroy]

  # get "/mygames", to: "users#games"
  get "/profile", to: "users#show"
  # get "/bookings", to: "users#index"
  resources :bookings do
    member do
      patch ":id/accept", to: "bookings#accept"
      patch ":id/decline", to: "bookings#decline"
    end
  end
end
