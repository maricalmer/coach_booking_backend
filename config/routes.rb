Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :coaches, only: [:index] do
    resources :slots, only: [:index]
  end
end
