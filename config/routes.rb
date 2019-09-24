# frozen_string_literal: true

Rails.application.routes.draw do
  resources :plans, only: :index
  resources :subscriptions, only: %i[index show create destroy]
  mount_devise_token_auth_for 'User', at: 'auth'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
