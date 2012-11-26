Rehash::Application.routes.draw do

  resources :users

  root :to => 'welcome#login'

  get '/index' => 'welcome#index', :as => 'dashboard'

  resources :tweetstores

end
