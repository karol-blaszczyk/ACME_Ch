# frozen_string_literal: true

Rails.application.routes.draw do
  resources :plans, only: :index
  resources :subscriptions, only: %i[index show create destroy]
  mount_devise_token_auth_for 'User', at: 'auth'
end
