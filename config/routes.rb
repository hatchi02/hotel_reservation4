Rails.application.routes.draw do
  root 'homes#index'

  devise_for :users
  get 'users/account'
  get 'users/profile'
  get 'users/profile/edit' => 'users#profile_edit'
  patch 'users/profile/update' => 'users#profile_update'
  
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
