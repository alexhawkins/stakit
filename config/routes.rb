Stakit::Application.routes.draw do
  resources :user_attachments

  resources :stack_supplements do
     collection { post :sort }
  end

  resources :frequencies
  resources :stacks do
    resources :stack_supplements
  end
  resources :supplements
  get 'landing/index'
  get 'landing/about'
  

  devise_for :users, controllers: { sessions: "users/sessions" },
           :path => '', 
           :path_names => { 
              :sign_in => "login", 
              :sign_out => "logout", 
              :sign_up => "register",
              :edit => "settings" }

  resources :users, only: [:update, :show]

  root to: 'stacks#index'
end
