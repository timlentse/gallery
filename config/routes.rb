Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'images#index'
  resources :tags, only: [:show]
  resources :images, only: [:index, :new, :create, :update]
  get '/qiniu_uptokens', to: 'qiniu_uptokens#create'
end
