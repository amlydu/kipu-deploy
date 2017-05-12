Rails.application.routes.draw do
  root to: 'release_mains#index'
  post 'loginfo', to: 'lambdas_controller#create'

  resources :logs
  resources :releases
  resources :release_mains
  resources :instances
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  mount ActionCable.server => '/cable'
end
