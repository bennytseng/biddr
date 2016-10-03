Rails.application.routes.draw do
  resources :auctions do
    resources :bids
  end

  resources :users, only: [:new, :create]

  resources :sessions, only: [:new, :create] do
    delete :destroy, on: :collection
  end

  root "home#index"
end
