
class DeviceTypesController < ApplicationController
  before_action :set_device_type, only: [:show, :edit, :update, :destroy]

  # GET /device_types
  def index
    @device_types = DeviceType.all.order(sort_params).page(params[:page])
  end

  # GET /device_types/1
  def show
  end

  # GET /device_types/new
  def new
    @device_type = DeviceType.new
  end

  # GET /device_types/1/edit
  def edit
  end

  # POST /device_types
  def create
    @device_type = DeviceType.new(device_type_params)

    if @device_type.save
      redirect_to device_types_url, :flash => { :success => 'Device type was successfully created.' }
    else
      render :new
    end
  end

  # PATCH/PUT /device_types/1
  def update
    if @device_type.update(device_type_params)
      redirect_to device_types_url, :flash => { :success => 'Device type was successfully updated.' }
    else
      render :edit
    end
  end

  # DELETE /device_types/1
  def destroy
    @device_type.destroy
    redirect_to device_types_url, :flash => { :success => 'Device type was successfully deleted.' }
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_device_type
      @device_type = DeviceType.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def device_type_params
      params.require(:device_type).permit(:title)
    end
end
