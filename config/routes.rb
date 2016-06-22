Rails.application.routes.draw do

  root to: 'calls#index'

  resources :calls, only: [:index] do
    post :incoming,     on: :collection
    post :dialcallback,    on: :collection
    post :record,       on: :collection
    post :dialaction,   on: :collection
  end
end
