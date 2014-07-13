class PurchasedItemsController < ApplicationController
  before_action :set_purchased_item, only: [:show, :edit, :update, :destroy]

  # GET /purchased_items
  # GET /purchased_items.json
  def index
    @purchased_items = PurchasedItem.all
  end

  # GET /purchased_items/1
  # GET /purchased_items/1.json
  def show
  end

  # GET /purchased_items/new
  def new
    @purchased_item = PurchasedItem.new
  end

  # GET /purchased_items/1/edit
  def edit
  end

  # POST /purchased_items
  # POST /purchased_items.json
  def create
    @purchased_item = PurchasedItem.new(purchased_item_params)

    respond_to do |format|
      if @purchased_item.save
        format.html { redirect_to @purchased_item, notice: 'Purchased item was successfully created.' }
        format.json { render :show, status: :created, location: @purchased_item }
      else
        format.html { render :new }
        format.json { render json: @purchased_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /purchased_items/1
  # PATCH/PUT /purchased_items/1.json
  def update
    respond_to do |format|
      if @purchased_item.update(purchased_item_params)
        format.html { redirect_to @purchased_item, notice: 'Purchased item was successfully updated.' }
        format.json { render :show, status: :ok, location: @purchased_item }
      else
        format.html { render :edit }
        format.json { render json: @purchased_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /purchased_items/1
  # DELETE /purchased_items/1.json
  def destroy
    @purchased_item.destroy
    respond_to do |format|
      format.html { redirect_to purchased_items_url, notice: 'Purchased item was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_purchased_item
      @purchased_item = PurchasedItem.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def purchased_item_params
      params.require(:purchased_item).permit(:description, :price, :quantity, :purchaser_id, :merchant_id, :upload_id)
    end
end
