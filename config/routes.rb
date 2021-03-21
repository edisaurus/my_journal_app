Rails.application.routes.draw do
  root 'home#index'
  get 'home/index'

  devise_for :users, controllers: { registrations: "registrations" }

  resources :categories do
    resources :tasks
  end

end
