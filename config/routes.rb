Rails.application.routes.draw do
  root to: 'boards#new'

  get ':permalink' => 'boards#fallback'

  scope 'b' do
    get ':permalink' => 'boards#show', as: :board
  end

  resources :boards, param: :permalink, only: %i(create)

  namespace :api do
    get ':permalink' => 'boards#show', as: :board

    scope ':permalink', as: :board, module: :boards do
      resource :state, only: %i(update)

      resources :keeps,    only: %i(create destroy)
      resources :problems, only: %i(create destroy)
      resources :tris,     only: %i(create destroy)

      resources :remarks, only: %i(), module: :remarks do
        resources :reactions, only: %i(create)
      end
    end
  end

  get '.well-known/acme-challenge/:id' => 'letsencrypt#show'
end
