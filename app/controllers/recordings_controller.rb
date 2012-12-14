require 'date'

class RecordingsController < ApplicationController
  
  def login
    
  end
  
  def index
    # get first three items from the tweet database
      @recordings = Recording.all
  end
  
  def dashboard
    @recordings = Recording.all
    @recording = Recording.new
    
    @recording.start = Time.now()
    @recording.date_text = Time.now().strftime("%m/%d/%Y")
    @recording.time_text = Time.now().strftime("%I:%M%p")

    @my_current_recordings = User.find_by_id(session[:user_id]).recordings
    @my_current_recordings = @my_current_recordings.where('start < ?', Time.now)
    @my_current_recordings = @my_current_recordings.where('end_time > ?', Time.now)
          
    @my_scheduled_recordings = User.find_by_id(session[:user_id]).recordings.where('start > ?', Time.now)
    
    @my_saved_recordings = User.find_by_id(session[:user_id]).recordings.where('end_time < ?', Time.now)
    
    respond_to do |format|
      format.html 
    end
  end  
  
  def create
    @recording = Recording.new(params[:recording])

    dt_text = @recording.date_text + " " + @recording.time_text
    @recording.start = DateTime.strptime(dt_text, '%m/%d/%Y %I:%M%p')
    @recording.end_time = @recording.start + @recording.duration.hours

    puts "Scheduling recording from " + @recording.start.strftime("%m/%d/%Y  %I:%M%p") + " to " + @recording.end_time.strftime("%m/%d/%Y  %I:%M%p")

    @recording.user = User.find_by_id(session[:user_id]) 

    respond_to do |format|
      if @recording.save
        format.html { redirect_to '/dashboard', notice: 'Recording was successfully created.' }
      else
        format.html { render action: "/dashboard" }
      end
    end
  end
  
  
end