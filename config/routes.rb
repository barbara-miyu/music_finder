Rails.application.routes.draw do
 # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  devise_for :users
    
  resources :users, only: [:show]
 
  resources :songs do
    resources :likes, only: [:create, :destroy]
    resources :comments, only: [:create, :destroy]
  end
  root "songs#index"

  resources :songquestions do
    resources :songanswers, only: [:create, :destroy]
  end

  get "tops" => "tops#index"

end
