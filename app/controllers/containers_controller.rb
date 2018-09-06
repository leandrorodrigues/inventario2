
class ContainersController < ApplicationController
  before_action :set_container, only: [:show, :edit, :update, :destroy]

  # GET /containers
  def index
    @containers = Container.all.search(search_params).order(sort_params).page(params[:page])
  end

  # GET /containers/1
  def show
  end

  # GET /containers/new
  def new
    @container = Container.new
  end

  # GET /containers/1/edit
  def edit
  end

  # POST /containers
  def create
    @container = Container.new(container_params)

    if @container.save
      redirect_to containers_url, :flash => { :success => 'Container was successfully created.' }
    else
      render :new
    end
  end

  # PATCH/PUT /containers/1
  def update
    if @container.update(container_params)
      redirect_to containers_url, :flash => { :success => 'Container was successfully updated.' }
    else
      render :edit
    end
  end

  # DELETE /containers/1
  def destroy
    @container.destroy
    redirect_to containers_url, :flash => { :success => 'Container was successfully deleted.' }
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_container
      @container = Container.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def container_params
      params.require(:container).permit(:title, :place_id, :item_id, :container_type_id, :reverse, :container_id)
    end
end
