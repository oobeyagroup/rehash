class TweetstoresController < ApplicationController
  # GET /tweetstores
  # GET /tweetstores.json
  def index
    @tweetstores = Tweetstore.all

    respond_to do |format|
      format.html # index.html.erb
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
