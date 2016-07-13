Rails.application.routes.draw do

  resources :games, only: [:show, :create] do
    resources :nodes, only: [:index, :create]
  end

end
