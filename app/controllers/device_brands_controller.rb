
class DeviceBrandsController < ApplicationController
  before_action :set_device_brand, only: [:show, :edit, :update, :destroy]

  # GET /device_brands
  def index
    @device_brands = DeviceBrand.all.order(sort_params).page(params[:page])
  end

  # GET /device_brands/1
  def show
  end

  # GET /device_brands/new
  def new
    @device_brand = DeviceBrand.new
  end

  # GET /device_brands/1/edit
  def edit
  end

  # POST /device_brands
  def create
    @device_brand = DeviceBrand.new(device_brand_params)

    if @device_brand.save
      redirect_to device_brands_url, :flash => { :success => 'Device brand was successfully created.' }
    else
      render :new
    end
  end

  # PATCH/PUT /device_brands/1
  def update
    if @device_brand.update(device_brand_params)
      redirect_to device_brands_url, :flash => { :success => 'Device brand was successfully updated.' }
    else
      render :edit
    end
  end

  # DELETE /device_brands/1
  def destroy
    @device_brand.destroy
    redirect_to device_brands_url, :flash => { :success => 'Device brand was successfully deleted.' }
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_device_brand
      @device_brand = DeviceBrand.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def device_brand_params
      params.require(:device_brand).permit(:title)
    end
end
