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

    respond_to do |format|
      format.html 
    end
  end  
  
  def create
    @recording = Recording.new(params[:recording])

    respond_to do |format|
      if @recording.save
        format.html { redirect_to '/dashboard', notice: 'Recording was successfully created.' }
      else
        format.html { render action: "/dashboard" }
      end
    end
  end
  
  
end