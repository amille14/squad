SquadApi::Engine.routes.draw do

  # TODO: Add routes for squad_users, room_users, post_users

  resources :users, only: [:show, :update] do
    member do
      resource :room, only: [:show, :update] do
        resources :messages, only: [:index, :create, :update, :delete]

        resources :posts, only: [:index, :show, :create, :update, :delete] do
          resources :messages, only: [:index, :create, :update, :delete]
        end
      end
    end
  end

  resources :squads, only: [:show, :update, :delete] do
    resources :users, only: [:index, :show, :update]

    resources :rooms, only: [:index, :show, :create, :update, :delete] do
      resources :messages, only: [:index, :create, :update, :delete]

      resources :posts, only: [:index, :show, :create, :update, :delete] do
        resources :messages, only: [:index, :create, :update, :delete]
      end
    end
  end

end
