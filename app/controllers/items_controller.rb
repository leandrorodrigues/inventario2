
class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :edit, :update, :destroy]

  # GET /items
  def index
    @items = Item.all.order(sort_params).page(params[:page])
  end

  # GET /items/1
  def show
  end

  # GET /items/new
  def new
    @item = Item.new
  end

  # GET /items/1/edit
  def edit
  end

  # POST /items
  def create
    @item = Item.new(item_params)

    if @item.save
      redirect_to items_url, :flash => { :success => 'Item was successfully created.' }
    else
      render :new
    end
  end

  # PATCH/PUT /items/1
  def update
    if @item.update(item_params)
      redirect_to items_url, :flash => { :success => 'Item was successfully updated.' }
    else
      render :edit
    end
  end

  # DELETE /items/1
  def destroy
    @item.destroy
    redirect_to items_url, :flash => { :success => 'Item was successfully deleted.' }
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_item
      @item = Item.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def item_params
      params.require(:item).permit(:number, :title, :brand_name, :model_description, :serial_number, :warranty_date, :value, :net_value, :allocation)
    end
end