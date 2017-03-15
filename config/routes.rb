Rails.application.routes.draw do

  root "chat_space#index"
  resources :chat_space, only: :index


end
