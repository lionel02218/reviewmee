Rails.application.routes.draw do
  devise_for :users, :controllers => { registrations: 'registrations' }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users, only: [:index] do
    get :profile
    post :setup_profile
  end
  post :subscribe, to: 'home#subscribe'
  root "home#index"
end
