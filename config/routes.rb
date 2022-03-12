Rails.application.routes.draw do
  #pins
  resources :pins
  
  #devise
  devise_for :users
  
  devise_scope :user do
    get 'users/sign_out' => "devise/sessions#destroy"
  end
  #devise


  #rails
  root 'pins#index'
  get 'home/about'
  #rails
end
