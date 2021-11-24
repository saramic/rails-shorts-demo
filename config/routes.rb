Rails.application.routes.draw do
  resources :stats
  resources :urls

  get "/:id", to: "urls#redirect", as: :redirect

  root to: "urls#index"
end
