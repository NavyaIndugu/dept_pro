Rails.application.routes.draw do
  resources :colleges
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  #devise_for :users
  root to: "depts#index"
  resources :depts do
   
   member do
    get 'download_pdf'
    end
  end
  namespace :api, defaults: {format: 'json'} do
    namespace :v1 do
    resources :depts
    end
    end
    devise_for :users, controllers: {registrations: 'users/registrations'}
end
