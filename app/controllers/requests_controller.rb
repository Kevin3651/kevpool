class RequestsController < ApplicationController
  # GET /requests
  # GET /requests.xml
  before_filter :authenticate_user!, :except => [:index, :show]
  def index
    @requests = Request.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @requests }
    end
  end

  # GET /requests/1
  # GET /requests/1.xml
  def show
    @request = Request.find(params[:id])
    authorize! :show, @request

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @request }
    end
  end

  # GET /requests/new
  # GET /requests/new.xml
  def new
    @request = Request.new
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @request }
    end
  end

  # GET /requests/1/edit
  def edit
    @request = Request.find(params[:id])
  end

  # POST /requests
  # POST /requests.xml
  def create
    @ride = Ride.find(params[:ride_id])
    @request = @ride.requests.build
    @request.user_id = current_user.id
    @request.user_email = current_user.email
    respond_to do |format|
      if @request.save
        
        format.html { redirect_to(@ride, :notice => 'Request was successfully created.') }
        format.xml  { render :xml => @ride, :status => :created, :location => @ride }
      else
          format.html { render :template => "rides/show" }
          format.xml  { render :xml => @request.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /requests/1
  # PUT /requests/1.xml
  def update
    @request = Request.find(params[:id])
    @ride = @request.ride
    respond_to do |format|
      if @request.update_attributes(params[:request])
        format.html { redirect_to(@ride, :notice => 'Request was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @request.errors, :status => :unprocessable_entity }
      end
    end
  end
  
  # DELETE /requests/1
  # DELETE /requests/1.xml
  def destroy
    @request = Request.find(params[:id])
    @ride = Ride.find(params[:ride_id])
    authorize! :destroy, @request
    @request.destroy

    respond_to do |format|
      format.html { redirect_to(@ride, :notice => 'Request was successfully deleted.') }
      format.xml  { head :ok }
    end
  end
end
