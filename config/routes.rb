Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :tags
  get '/qiniu_uptokens', to: 'qiniu_uptokens#create'
  resources :images
end
