Rails.application.routes.draw do
  get 'bodies/new'
  get 'bodies/edit'
  get 'bodies/show'
  root to:'static_pages#home'

  controller :users do
    resources :users, except: [:index] do
      member do
        get :setting
        patch :email_update, :password_update
      end
    end
  end

  controller :sessions do
    get '/login', to: 'sessions#new'
    post '/login', to: 'sessions#create'
    delete 'logout', to: 'sessions#destroy'
  end

  controller :logs do
    resources :logs, except: [:destroy, :index]
  end

  controller :bodies do
    resources :bodies, only: [:index, :new, :create]
  end
end
