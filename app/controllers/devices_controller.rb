
class DevicesController < ApplicationController
  before_action :set_device, only: [:show, :edit, :update, :destroy]

  # GET /devices
  def index
    @devices = Device.all.order(sort_params).page(params[:page])
  end

  # GET /devices/1
  def show
  end

  # GET /devices/new
  def new
    @device = Device.new
  end

  # GET /devices/1/edit
  def edit
  end

  # POST /devices
  def create
    @device = Device.new(device_params)

    if @device.save
      redirect_to devices_url, :flash => { :success => 'Device was successfully created.' }
    else
      render :new
    end
  end

  # PATCH/PUT /devices/1
  def update
    if @device.update(device_params)
      redirect_to devices_url, :flash => { :success => 'Device was successfully updated.' }
    else
      render :edit
    end
  end

  # DELETE /devices/1
  def destroy
    @device.destroy
    redirect_to devices_url, :flash => { :success => 'Device was successfully deleted.' }
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_device
      @device = Device.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def device_params
      params.require(:device).permit(:title, :item_id, :device_model_id, :ip, :host, :description, :unknown)
    end
end
