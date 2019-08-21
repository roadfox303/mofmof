Rails.application.routes.draw do
  resources :properties do
    collection do
      post :confirm
    end
  end
  resources :stations, only:[:create, :destroy, :edit, :update]
end
