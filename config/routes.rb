Rails.application.routes.draw do
  resources :categories do
    resources :transactions
  end
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  authenticated :user do
    root "categories#index", as: :authenticated_root
  end

  root to: "home#index"

end
