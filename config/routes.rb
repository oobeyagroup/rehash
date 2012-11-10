Rehash::Application.routes.draw do

  root :to => 'welcome#index'

  resources :tweetstores

end
