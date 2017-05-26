Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :organizations, except: :destroy
  resources :projects, only: [:index, :show, :update, :destroy]

  root to: 'organizations#index'
end
