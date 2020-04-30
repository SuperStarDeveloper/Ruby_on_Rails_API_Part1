Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  get 'home/index'
  root 'home#index'
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      resources :company
      resources :lathe
      resources :mill
      namespace :users do 
        devise_scope :users do
          post "/sign_in", :to => 'sessions#create'
          delete "/sign_out", :to => 'sessions#destroy'
          post "/sign_up", :to => 'registrations#create'
        end
      end
    end
  end
end

