Rails.application.routes.draw do

  get 'messages/create'
  devise_for :users, controllers: { registrations: "registrations" }
  mount StripeEvent::Engine, at: '/stripe-webhooks'

  root to: 'pages#home'

  resources :activities, only: [] do
    collection do
      post 'calculate_experience', to: 'activities#calculate_experience'
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'admin_index', to: 'experiences#admin_index'
  resources :experiences, only: [:index, :new, :create, :edit, :update, :show] do
    resources :experience_slices, only: [:new, :create, :edit, :update]
    resources :payments, only: :new
    resources :experience_preferences_categories, only: [:new, :create]
  end

  post 'experience_preferences_form', to: 'experiences#preferences_form'

  require "sidekiq/web"
  authenticate :user, lambda { |u| u.admin } do
    mount Sidekiq::Web => '/sidekiq'
  end
end
