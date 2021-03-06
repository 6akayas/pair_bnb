Rails.application.routes.draw do
    # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
    root 'static#index'

    resources :passwords, controller: "clearance/passwords", only: [:create, :new]
    resource :session, controller: "clearance/sessions", only: [:create]

    resources :users do
        resource :password,
        controller: "clearance/passwords",
        only: [:create, :edit, :update]
    end

    resources :listings do
      resource :reservation
    end

    resources :reservations do
      get 'braintree/new'
      post 'braintree/checkout'
      get 'braintree/show'
    end


get "/sign_in" => "clearance/sessions#new", as: "sign_in"
delete "/sign_out" => "clearance/sessions#destroy", as: "sign_out"
get "/sign_up" => "clearance/users#new", as: "sign_up"
get "/auth/:provider/callback" => "sessions#create_from_omniauth"

end
