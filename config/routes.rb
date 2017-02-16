Rails.application.routes.draw do
  root to: 'boards#new'

  get ':permalink' => 'boards#show', as: :board

  resources :boards, param: :permalink, only: %i(create)

  namespace :api do
    scope ':permalink', as: :board do
      resources :keeps,    only: %i(create)
      resources :problems, only: %i(create)
      resources :tries,    only: %i(create)
    end
  end
end
