Rehash::Application.routes.draw do

  resources :users

  root :to => 'welcome#login'

  get '/index' => 'welcome#dashboard', :as => 'index'
  get '/oldindex' => 'welcome#index', :as => 'oldindex'

  resources :tweetstores

  match 'auth/twitter/callback', to: 'sessions#create'

end
