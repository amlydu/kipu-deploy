Rails.application.routes.draw do
  root :to => 'instances#index'
  post 'loginfo', to: 'lambdas#create'

  resources :logs
  resources :releases
  resources :release_mains
  resources :instances
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
