Rails.application.routes.draw do

  root "posts#index"
  resources :users # do 
  #   resources :posts
  # end 
  get 'posts/search' => 'posts#search'

  resources :posts

  resource :session, controller: "sessions", only: [:create, :new, :destroy ]


  get "/sign_in" => "sessions#new", as: "sign_in"
  post "/sign_in" => "session#create"
  delete "/sign_out" => "sessions#destroy", as: "sign_out"
  get "/auth/:provider/callback" => "sessions#create_from_omniauth"


  
  post 'posts/search' => 'posts#search'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
