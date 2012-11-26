class WelcomeController < ApplicationController
  
  def login
    
  end
  
  def index
    # get first three items from the tweet database
      @tweets = Tweetstore.all
    end

  
end