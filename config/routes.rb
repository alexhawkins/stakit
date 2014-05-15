Stakit::Application.routes.draw do
  get 'landing/index'
  get 'landing/about'
  devise_for :users, 
           :path => '', 
           :path_names => { 
              :sign_in => "login", 
              :sign_out => "logout", 
              :sign_up => "register" }
  root to: 'landing#index'
end
