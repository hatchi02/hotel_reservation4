Rails.application.routes.draw do
  root 'homes#index'

  devise_for :users
  get 'users/account'
  get 'users/profile'
  
  resources :rooms do
    collection do
      get 'own'
    end
  end

  resources :reservations do
    member do
      post 'confirm' => 'reservations#confirm'
      post 'back' => 'reservations#back'
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
