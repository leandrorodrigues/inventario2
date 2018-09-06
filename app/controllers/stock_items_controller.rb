
class StockItemsController < ApplicationController
  before_action :set_stock_item, only: [:show, :edit, :update, :destroy]

  # GET /stock_items
  def index
    @stock_items = StockItem.all.search(search_params).order(sort_params).page(params[:page])
  end

  # GET /stock_items/1
  def show
  end

  # GET /stock_items/new
  def new
    @stock_item = StockItem.new
  end

  # GET /stock_items/1/edit
  def edit
  end

  # POST /stock_items
  def create
    @stock_item = StockItem.new(stock_item_params)

    if @stock_item.save
      redirect_to stock_items_url, redirect_notice(@stock_item)
    else
      render :new
    end
  end

  # PATCH/PUT /stock_items/1
  def update
    if @stock_item.update(stock_item_params)
      redirect_to stock_items_url, redirect_notice(@stock_item)
    else
      render :edit
    end
  end

  # DELETE /stock_items/1
  def destroy
    @stock_item.destroy
    redirect_to stock_items_url, redirect_notice(@stock_item)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_stock_item
      @stock_item = StockItem.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def stock_item_params
      params.require(:stock_item).permit(:title, :item_id, :quantity, :is_package, :package_quantity)
    end
end
