Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :aliens do
    collection do
      get 'search'
    end
    resources :bookings, only: [:new, :create]
    end
    resources :bookings, only: [:index, :show, :edit, :update, :destroy] do
      collection do
        post ':id/rating/:rating' => :rating, as: :rating
      end
    end
end
