Rails.application.routes.draw do
  devise_for :users
  root, to: "schemas#index"
  resources :schemas
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
