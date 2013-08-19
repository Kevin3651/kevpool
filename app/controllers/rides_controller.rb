class RidesController < ApplicationController
  before_action :set_ride, only: [:show, :edit, :update, :destroy]
before_filter :authenticate_user!, :except => [:index, :show]
  # GET /rides
  # GET /rides.json
rescue_from CanCan::AccessDenied do |exception|
  flash[:alert] = exception.message
  redirect_to root_url
end
  def index
    
    @search = Ride.search(params[:q])
    @rides = @search.result


  end

  # GET /rides/1
  # GET /rides/1.json
  def show
  end

  # GET /rides/new
  def new
    @ride = Ride.new
  end

  # GET /rides/1/edit
  def edit
   authorize! :edit, @ride
  end

  # POST /rides
  # POST /rides.json
  def create
    @ride = Ride.new(ride_params)
    @ride.user_id = current_user.id
    @ride.user_email = current_user.email
    authorize! :create, @ride
    respond_to do |format|
      if @ride.save
        format.html { redirect_to @ride, notice: 'Ride was successfully created.' }
        format.json { render action: 'show', status: :created, location: @ride }
      else
        format.html { render action: 'new' }
        format.json { render json: @ride.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /rides/1
  # PATCH/PUT /rides/1.json
  def update
    authorize! :update, @ride
    respond_to do |format|
      if @ride.update(ride_params)
        format.html { redirect_to @ride, notice: 'Ride was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @ride.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /rides/1
  # DELETE /rides/1.json
  def destroy
    authorize! :destroy, @ride
    @ride.destroy
    respond_to do |format|
      format.html { redirect_to rides_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ride
      @ride = Ride.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def ride_params
      params.require(:ride).permit(:I_am, :Starting_From, :Going_to, :string, :depart, :return, :Price, :Seats, :Notes)
    end
end
