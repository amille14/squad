Api::Engine.routes.draw do

  resources :squads, only: [:index, :show, :create, :update, :delete] do
    resources :users, only: [:index, :show, :update]

    resources :rooms, only: [:index, :show, :create, :update, :delete] do
      resources :messages, only: [:index, :create, :update, :delete]

      resources :posts, only: [:index, :show, :create, :update, :delete] do
        resources :messages, only: [:index, :create, :update, :delete]
      end
    end
  end
end
