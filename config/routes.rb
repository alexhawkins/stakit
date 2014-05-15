Stakit::Application.routes.draw do
  resources :stack_supplements
  resources :frequencies
  resources :stacks do
    resources :stack_supplements
  end
  resources :supplements
  get 'landing/index'
  get 'landing/about'
  
  devise_for :users, 
           :path => '', 
           :path_names => { 
              :sign_in => "login", 
              :sign_out => "logout", 
              :sign_up => "register",
              :edit => "settings" }

  resources :users, only: [:update]

  root to: 'landing#index'
end
