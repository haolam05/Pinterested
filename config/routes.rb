Rails.application.routes.draw do
  resources :pins
  #devise
  devise_for :users
  
  devise_scope :user do
    get 'users/sign_out' => "devise/sessions#destroy"
  end
  #devise


  #rails
  root 'home#index'
  get 'home/about'
  #rails
end
