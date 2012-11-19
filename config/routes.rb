Rehash::Application.routes.draw do

  resources :users

  root :to => 'welcome#index'

  resources :tweetstores

end
