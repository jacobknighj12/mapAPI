Rails.application.routes.draw do
  root 'pages#home'

  # match '*path', via: [:options], to: lambda {|_| [204, { 'Content-Type' => 'text/plain' }]}
  use_doorkeeper
  devise_for :users
  resources :entries
  draw :api
   # global options responder -> makes sure OPTION request for CORS endpoints work
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
