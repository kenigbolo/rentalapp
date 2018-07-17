Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'listings#index'
  post '/search', to: 'searches#create'
  get '/search', to: 'searches#index', as: 'search_results'
  resources :listings
end
