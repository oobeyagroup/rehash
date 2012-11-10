
require 'rubygems'
require 'tweetstream'

TweetStream.configure do |config|
  config.consumer_key       = '2ZlLFJN0JDIvSwVG3hWw'
  config.consumer_secret    = 'oZsLqN9TQc1IERxGRMieRLmk6U5liqUQe9yVa863BLw'
  config.oauth_token        = '23986022-9SfbGAvrKTvyCGxD6M28kA4vRLXlAMClBVerpPcYI'
  config.oauth_token_secret = 'WFefjLwdcLqejcmFhYFXiBYOUzEihgLMS5HpVsm33w'
  config.auth_method        = :oauth
end

count = 0
Tweetstore.destroy_all

TweetStream::Client.new().sample do |status|
  print "."
  STDOUT.flush
  count += 1
  Tweetstore.create  :name => status.user.name,
                    :screen_name => status.user.screen_name,
                    :text => status.text,
                    :tweeted_at => status.created_at,
                    :profile_image_url =>  status.user.profile_image_url
  if count == 50
    break
  end   

end
puts "\nComplete"