Rails.application.routes.draw do
  root 'pages#home'
  get 'index' => 'pages#index'
  get 'new' => 'pages#new'
  post 'new' => 'pages#create'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
