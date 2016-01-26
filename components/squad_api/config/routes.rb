SquadApi::Engine.routes.draw do
  resources :users, only: [:index, :show, :update]

  # resources :squads, only: [:index, :show, :create, :update, :delete] do
  #   resources :rooms, only: [:index, :show, :create, :update, :delete] do
  #     resources :messages, only: [:index, :create, :update, :delete]

  #     resources :posts, only: [:index, :show, :create, :update, :delete] do
  #       resources :messages, only: [:index, :create, :update, :delete]
  #     end
  #   end
  # end
end
