class Tweetstore < ActiveRecord::Base
  attr_accessible :name, :profile_image_url, :screen_name, :text, :tweeted_at
end
