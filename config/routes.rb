Rails.application.routes.draw do
  root "page#index"

  resources :page
  resources :exercises
  resources :exercise_sets

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check
end