Rails.application.routes.draw do
  root to:'static_pages#home'
  controller :users do
    resources :users do
      member do
        get :setting
        patch :email_update, :password_update
      end
    end
  end

end
