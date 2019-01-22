Rails.application.routes.draw do
  devise_for :users
  #resources :chat_rooms, only: [:new, :create, :show, :index]
  resources :chat_rooms
  resources :messages
  root 'chat_rooms#index'

  #   post "chat_rooms/id" => "chat_rooms#create"
  post "chat_rooms/:id(.:format)" => "messages#create"

  mount ActionCable.server, at: '/cable'
end
