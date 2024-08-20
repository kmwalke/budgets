Rails.application.routes.draw do
  get 'home/index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get 'up' => 'rails/health#show', as: :rails_health_check

  root 'federals#show'

  get '/federals', to: 'federals#show', as: 'federal'
  get '/states/:id', to: 'states#show', as: 'state'
  get '/counties/:id', to: 'counties#show', as: 'county'
  get '/cities/:id', to: 'cities#show', as: 'city'
  get '/departments/:id', to: 'departments#show', as: 'department'

  devise_for :users, skip: :registration, path: 'admin'

  namespace :admin do
    resources :municipalities
  end
end
