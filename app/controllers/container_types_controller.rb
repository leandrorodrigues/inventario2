
class ContainerTypesController < ApplicationController
  before_action :set_container_type, only: [:show, :edit, :update, :destroy]

  # GET /container_types
  def index
    @container_types = ContainerType.all.order(sort_params).page(params[:page])
  end

  # GET /container_types/1
  def show
  end

  # GET /container_types/new
  def new
    @container_type = ContainerType.new
  end

  # GET /container_types/1/edit
  def edit
  end

  # POST /container_types
  def create
    @container_type = ContainerType.new(container_type_params)

    if @container_type.save
      redirect_to container_types_url, :flash => { :success => 'Container type was successfully created.' }
    else
      render :new
    end
  end

  # PATCH/PUT /container_types/1
  def update
    if @container_type.update(container_type_params)
      redirect_to container_types_url, :flash => { :success => 'Container type was successfully updated.' }
    else
      render :edit
    end
  end

  # DELETE /container_types/1
  def destroy
    @container_type.destroy
    redirect_to container_types_url, :flash => { :success => 'Container type was successfully deleted.' }
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_container_type
      @container_type = ContainerType.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def container_type_params
      params.require(:container_type).permit(:title, :slots, :nested)
    end
end
