Rails.application.routes.draw do
  devise_for :users

  devise_scope :user do
    authenticated :user do
      root 'home#index', as: :authenticated_root
    end
    get 'login', to: 'devise/sessions#new'
    delete 'logout', to: 'devise/sessions#destroy'

    unauthenticated do
      root 'devise/sessions#new', as: :unauthenticated_root
    end
  end

  resources :locations do
    resources :schedule_locations
  end
end
