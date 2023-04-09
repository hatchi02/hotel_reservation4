Rails.application.routes.draw do
  get 'reservations/index'

  get 'rooms/index'
  
  devise_for :users

  resources :rooms do
    collection do
      get 'own'
    end
  end

  root 'homes#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
