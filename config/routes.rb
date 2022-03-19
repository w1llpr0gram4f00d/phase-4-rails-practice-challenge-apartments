Rails.application.routes.draw do
  resources :leases, only: [:create, :destroy]
  resources :tenants, only: [:create, :index, :update, :destroy]
  resources :apartments, only: [:create, :index, :update, :destroy]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
