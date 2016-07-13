Rails.application.routes.draw do

  resources :games, only: [:show, :create] do
    resources :nodes, only: [:index, :update]
    resources :actions, only: [] do
      collection do
        post :roll_dice
      end
    end
  end

end
