Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root 'home#index'

  delete 'logout' => 'session#destroy', :as => 'logout'
  get 'login' => 'session#login', :as => 'get_login'
  post 'login' => 'session#create', :as => 'login'
  get 'signup' => 'session#register', :as => 'signup'
  post 'signup' => 'users#create', :as => 'post_signup'
  post 'post_new_user',  to: 'users#new_user'

  resources :users do
    put 'toggle_deactivate', to: 'users#toggle_deactivate'
  end
  resources :students
end
