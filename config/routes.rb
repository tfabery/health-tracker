Rails.application.routes.draw do
  root :to => 'application#index'
  devise_for :users
  resources :users do
    resources :foods
  end

  resources :users do
    resources :exercises
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
