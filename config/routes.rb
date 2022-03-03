Rails.application.routes.draw do
  devise_for :users
  root to: 'tweets#index'

  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end

  resources :tweets do
    resources :comments, only: [:create, :destroy]
  end
  resources :users, only: :show

  resources :meal_records
end
