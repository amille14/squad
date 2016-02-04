Rails.application.routes.draw do

  # root to: redirect(subdomain: "app", path: "/")
  # constraints subdomain: "app" do
  # ...
  # end

  root to: "squads#bootstrap"
  resources :squads, only: [:index, :show, :create]

  # Serve websocket cable requests in-process
  mount ActionCable.server => '/cable'

  # Mount Engines
  namespace :api, defaults: {format: 'json'} do
    mount SquadApi::Engine => '/', as: 'squad_api'
  end
end
