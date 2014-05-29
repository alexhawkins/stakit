Stakit::Application.routes.draw do
  resources :answers

  resources :topics
  resources :questions

  resources :user_attachments

  resources :stack_supplements do
     collection { post :sort }
  end

  resources :frequencies
  resources :stacks do
    resources :stack_supplements
    # route for updating default stack on specific stack id
    # note that we use member to update/act on a singular object like stacks/1/default_stack
    # and collection to act on/display a collection of ojbects like  stacks/search.
    put :default_stack, on: :member
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
  resources :favorite_stacks, only: [:create, :destroy]

  root to: 'stacks#index'
end
