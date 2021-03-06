Rails.application.routes.draw do

  root :to => "homes#top"

  get 'login' => "sessions#new"
  post 'login' => "sessions#create"
  delete 'logout' => "sessions#destroy"

  resources :users, only: [:new, :create, :index, :edit, :update]

  resources :spots, only: [:new, :create, :index, :show, :edit, :update, :destroy] do
    resources :spot_comments, only: [:create, :destroy]
    resource :likes, only: [:create, :destroy]
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
