Rails.application.routes.draw do
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
    resources :logs, except: [:destroy]
  end
end
