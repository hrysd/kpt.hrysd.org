Rails.application.routes.draw do
  root to: 'boards#new'

  resources :boards, param: :permalink, only: %i(show create)
end
