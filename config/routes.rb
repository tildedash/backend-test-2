Rails.application.routes.draw do

  resources :calls do
    post :incoming,     on: :collection
    post :dialcallback,    on: :collection
    post :record,       on: :collection
    post :dialaction,   on: :collection
  end
end
