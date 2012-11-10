class WelcomeController < ApplicationController
  
  def index
    
      @this_tweet = Tweetstore.first
    end

  
end