require 'rubygems'
require "active_record"
require 'tweetstream'

ActiveRecord::Base.establish_connection ( 
  {:adapter => "sqlite3",
  :host => "localhost",
  :username => "guestadmin",
  :password => "rehash",
  :database => "db/development.sqlite3" }
  )
ActiveRecord::Base.logger = Logger.new(STDERR)


class Tweetstore < ActiveRecord::Base
  attr_accessible :name, :profile_image_url, :screen_name, :text, :tweeted_at
end


puts "Currently " + Tweetstore.count.to_s + " tweet(s) being stored"

TweetStream.configure do |config|
  config.consumer_key       = '5nXwpUUV7nZnhPYUnE5YA'  
  config.consumer_secret    = '8BQWOjhP9wNDsLhMRxtAobI31InkjtreGwj564s'
  
  # this works
  config.oauth_token        = '23986022-D3SsBwiyDCY17XQ7twwPZQLnOPtvSONWcW8Ah4tSM'
  config.oauth_token_secret = 'CqsH6OEngftmQiHYtw6OmQSlFM9ch1jGUUTr2pUo'
    
  config.auth_method        = :oauth
end



puts "Listening    #{Time.now}"


client = TweetStream::Client.new

client.on_error do |message|
  puts "Error: #{Time.now}"
  puts message
end

client.on_direct_message do |direct_message|
  puts Time.now
  puts "@#{direct_message.sender.screen_name} sent a direct message"
  puts direct_message.text
end

client.on_timeline_status do |status|
  puts Time.now
  puts "@#{status.user.screen_name} said"
  puts status.text
  Tweetstore.create  :name => status.user.name,
                 :screen_name => status.user.screen_name,
                 :text => status.text,
                 :tweeted_at => status.created_at,
                 :profile_image_url =>  status.user.profile_image_url
end

client.userstream