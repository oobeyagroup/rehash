require 'rubygems'
require 'tweetstream'

def start_stream

  TweetStream.configure do |config|
    # this combination works, these values are in initializers/omniauth.rb
    config.consumer_key       = '5nXwpUUV7nZnhPYUnE5YA'  
    config.consumer_secret    = '8BQWOjhP9wNDsLhMRxtAobI31InkjtreGwj564s'

    config.oauth_token        = User.first.token
    config.oauth_token_secret =  User.first.secret
    puts "---------"
    puts config.oauth_token
    puts config.oauth_token_secret
    puts "---------"

    config.auth_method        = :oauth
  end

  # @client = Twitter::Client.new(
  #   :oauth_token => User.first.token
  #   :oauth_token_secret => User.first.secret
  # )
puts "*********"
puts config.oauth_token
puts config.oauth_token_secret
puts "*********"

  count = 0
  Tweetstore.destroy_all
  
  
  # TweetStream::Client.new.track('obama') do |status|  

  # client = TweetStream::Client.new
  # 
  # client.sitestream([session[:uid]], :followings => true) do |status|

  if config.oauth_token && config.oauth_token_secret
    TweetStream::Client.new().sample do |status|
    
      count += 1
      puts count
      Tweetstore.create  :name => status.user.name,
                      :screen_name => status.user.screen_name,
                      :text => status.text,
                      :tweeted_at => status.created_at,
                      :profile_image_url =>  status.user.profile_image_url
      if count > 5
        break
      end
    end
  else
    puts "No token or secret"
  end  
end 


class TweetstoresController < ApplicationController
  # GET /tweetstores
  # GET /tweetstores.json
  def index
    start_stream
    @tweetstores = Tweetstore.all
    
    respond_to do |format|
      format.html { redirect_to dashboard_url } # index.html.erb
      format.json { render json: @tweetstores }
    end
  end

  # GET /tweetstores/1
  # GET /tweetstores/1.json
  def show
    @tweetstore = Tweetstore.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @tweetstore }
    end
  end

  # GET /tweetstores/new
  # GET /tweetstores/new.json
  def new
    @tweetstore = Tweetstore.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @tweetstore }
    end
  end

  # GET /tweetstores/1/edit
  def edit
    @tweetstore = Tweetstore.find(params[:id])
  end

  # POST /tweetstores
  # POST /tweetstores.json
  def create
    @tweetstore = Tweetstore.new(params[:tweetstore])

    respond_to do |format|
      if @tweetstore.save
        format.html { redirect_to @tweetstore, notice: 'Tweetstore was successfully created.' }
        format.json { render json: @tweetstore, status: :created, location: @tweetstore }
      else
        format.html { render action: "new" }
        format.json { render json: @tweetstore.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /tweetstores/1
  # PUT /tweetstores/1.json
  def update
    @tweetstore = Tweetstore.find(params[:id])

    respond_to do |format|
      if @tweetstore.update_attributes(params[:tweetstore])
        format.html { redirect_to @tweetstore, notice: 'Tweetstore was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @tweetstore.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tweetstores/1
  # DELETE /tweetstores/1.json
  def destroy
    @tweetstore = Tweetstore.find(params[:id])
    @tweetstore.destroy

    respond_to do |format|
      format.html { redirect_to tweetstores_url }
      format.json { head :no_content }
    end
  end
end
