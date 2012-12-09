Rehash::Application.routes.draw do

  resources :users

  root :to => 'recordings#login'

  get '/dashboard' => 'recordings#dashboard', :as => 'dashboard'
  post '/dashboard' => 'recordings#create', :as => 'recordings'
  get '/recordings' => 'recordings#index', :as => 'recording'
  get '/oldindex' => 'recordings#index', :as => 'oldindex'

  resources :tweetstores

  match 'auth/twitter/callback', to: 'sessions#create'

end
