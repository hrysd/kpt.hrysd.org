Rails.application.routes.draw do
  root to: 'boards#new'

  get ':permalink' => 'boards#show', as: :board

  resources :boards, param: :permalink, only: %i(create)

  namespace :api do
    scope ':permalink', as: :board do
      resources :keeps,    only: %i(create destroy)
      resources :problems, only: %i(create destroy)
      resources :tries,    only: %i(create destroy)
    end
  end

  get '.well-known/acme-challenge/:id' => 'letsencrypt#show'
end
