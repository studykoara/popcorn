Rails.application.routes.draw do
  root "movies#index"
  get "bad_request" => "top#bad_request" # TODO:エラー発生用コマンド3行
  get "forbidden" => "top#forbidden"
  get "internal_server_error" => "top#internal_server_error"
  resources :movies, only: [:index, :show, :search] do
    get "search", on: :collection
    resources :performances do
        resources :seats do
          resources :reservations
        end
    end
  end
  resources :members do
    get "search", on: :collection
    resources :reservations
  end
  resource :session, only: [:create, :destroy]
  resource :account, only: [:show, :edit, :update, :destroy]
  resource :password, only:[:show, :edit, :update]
  # resources :performances
  resources :reservations # TODO:要らないかも？

  namespace :admin do
    root to: "top#index"
    resources :members do
      get "search", on: :collection
    end
    resources :movies do
      get "search", on: :collection
      resources :performances
    end
    resources :reservations, only: [:index]
  end
end
