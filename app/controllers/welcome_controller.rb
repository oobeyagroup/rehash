class WelcomeController < ApplicationController
  
  def index
    # get first three items from the tweet database
      @tweets = Tweetstore.all
    end

  
end