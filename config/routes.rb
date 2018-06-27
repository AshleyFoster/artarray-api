Rails.application.routes.draw do
  devise_for :users

  namespace :api, defaults: { format: :json } do
    devise_scope :user do
      post 'sign_in', to: 'sessions#create'
      delete 'sign_out', to: 'sessions#destroy'
      post 'signup', to: 'registrations#create'
    end

    root 'posts#index'
    resources :posts do
      resource :like
    end
  end
end
