Rails.application.routes.draw do
  root to: 'boards#new'

  get ':permalink' => 'boards#show', as: :board

  resources :boards, param: :permalink, only: %i(create)

  namespace :api do
    get ':permalink' => 'boards#show', as: :board

    scope ':permalink', as: :board do
      resources :keeps,    only: %i(create destroy)
      resources :problems, only: %i(create destroy)
      resources :tries,    only: %i(create destroy)

      resources :remarks, only: %i() do
        resources :reactions, only: %i(create)
      end
    end
  end

  get '.well-known/acme-challenge/:id' => 'letsencrypt#show'
end
