Stakit::Application.routes.draw do
  resources :videos
  resources :activities
  resources :user_attachments

  resources :topics
  resources :questions do
    resources :follow_questions, only: [:create, :destroy]
    resources :answers, only: [:create, :destroy, :show, :edit, :new] do
      get '/up-vote' => 'answer_votes#up_vote', as: :up_vote
      get '/down-vote' => 'answer_votes#down_vote', as: :down_vote
    end
  end

  resources :stacks do
    resources :stack_supplements
    # route for updating default stack on specific stack id
    # note that we use member to update/act on a singular object like stacks/1/default_stack
    # and collection to act on/display a collection of ojbects like  stacks/search.
    put :default_stack, on: :member
  end

  resources :stack_supplements do
     collection { post :sort }
  end

  resources :frequencies
  resources :supplements
  get 'landing/index'
  get 'landing/about'
  

  devise_for :users, controllers: { sessions: "users/sessions" },
           path: '', 
           path_names: { 
              sign_in: "login", 
              sign_out: "logout", 
              sign_up: "register",
              edit: "settings" 
            }

  resources :users, only: [:update, :show] do
    member do
      get :following, :followers
    end
  end

  resources :relationships, only: [:create, :destroy]
  resources :favorite_stacks, only: [:create, :destroy]

  root to: 'stacks#index'
end
