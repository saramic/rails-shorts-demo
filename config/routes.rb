Rails.application.routes.draw do
  resources :stats
  resources :urls
  resources :webpush_endpoints, only: %i[create]

  get '/:id', to: 'urls#redirect', as: :redirect

  root to: 'urls#index'
end
