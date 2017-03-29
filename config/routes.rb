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

  scope "/admin" do
    resources :users
  end

  resources :locations do
    resources :schedule_locations
  end

  namespace :api, defaults: { format: :json } do
    post :schedule, to: 'scheduler#is_open_or_close_to_location'
  end
end
