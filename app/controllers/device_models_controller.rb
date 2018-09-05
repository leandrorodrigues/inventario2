
class DeviceModelsController < ApplicationController
  before_action :set_device_model, only: [:show, :edit, :update, :destroy]

  # GET /device_models
  def index
    @device_models = DeviceModel.all.order(sort_params).page(params[:page])
  end

  # GET /device_models/1
  def show
  end

  # GET /device_models/new
  def new
    @device_model = DeviceModel.new
  end

  # GET /device_models/1/edit
  def edit
  end

  # POST /device_models
  def create
    @device_model = DeviceModel.new(device_model_params)

    if @device_model.save
      redirect_to device_models_url, :flash => { :success => 'Device model was successfully created.' }
    else
      render :new
    end
  end

  # PATCH/PUT /device_models/1
  def update
    if @device_model.update(device_model_params)
      redirect_to device_models_url, :flash => { :success => 'Device model was successfully updated.' }
    else
      render :edit
    end
  end

  # DELETE /device_models/1
  def destroy
    @device_model.destroy
    redirect_to device_models_url, :flash => { :success => 'Device model was successfully deleted.' }
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_device_model
      @device_model = DeviceModel.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def device_model_params
      params.require(:device_model).permit(:title, :device_brand_id, :device_type_id, :rack_units, :ethernet_interfaces, :fiber_interfaces, :stock_unit)
    end
end
