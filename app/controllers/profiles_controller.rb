class ProfilesController < ApplicationController
  # GET /profiles
  # GET /profiles.xml
  before_filter :authenticate_user!, :except => [:index, :show]
  def index
    @profiles = Profile.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @profiles }
    end
  end

  # GET /profiles/1
  # GET /profiles/1.xml
  def show
    @profile = Profile.find(params[:id])
    authorize! :show, @profile

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @profile }
    end
  end

  # GET /profiles/new
  # GET /profiles/new.xml
  def new
    @profile = Profile.new
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @profile }
    end
  end

  # GET /profiles/1/edit
  def edit
    @profile = Profile.find(params[:id])
  end

  # POST /profiles
  # POST /profiles.xml
  def create
    @user = User.find(params[:user_id])
    @profile = @user.profiles.build
    @profile.user_id = current_user.id
    respond_to do |format|
      if @profile.save
        
        format.html { redirect_to(@user, :notice => 'Profile was successfully created.') }
        format.xml  { render :xml => @user, :status => :created, :location => @user }
      else
          format.html { render :template => "users/show" }
          format.xml  { render :xml => @profile.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /profiles/1
  # PUT /profiles/1.xml
  def update
    @profile = Profile.find(params[:id])
    @user = @profile.user
    respond_to do |format|
      if @profile.update_attributes(params[:profile])
        format.html { redirect_to(@user, :notice => 'Profile was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @profile.errors, :status => :unprocessable_entity }
      end
    end
  end
  
  # DELETE /profiles/1
  # DELETE /profiles/1.xml
  def destroy
    @profile = Profile.find(params[:id])
    @user = User.find(params[:user_id])
    authorize! :destroy, @profile
    @profile.destroy

    respond_to do |format|
      format.html { redirect_to(@user, :notice => 'Profile was successfully deleted.') }
      format.xml  { head :ok }
    end
  end
end
