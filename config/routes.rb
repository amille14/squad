Rails.application.routes.draw do

  root to: "rooms#show"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # Serve websocket cable requests in-process
  mount ActionCable.server => '/cable'

  # Mount Engines
  mount SquadApi::Engine => '/api', as: 'squad_api'
end
