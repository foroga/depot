class OrderSuppliersController < ApplicationController
  before_action :set_order_supplier, only: [:show, :edit, :update, :destroy]
	before_action :find_order

  # GET /order_suppliers
  # GET /order_suppliers.json
  def index
    @order_suppliers = OrderSupplier.where(order_id: params[:order_id]).order('position ASC')
  end

  # GET /order_suppliers/1
  # GET /order_suppliers/1.json
  def show
  end

  # GET /order_suppliers/new
  def new
		@suppliers = Supplier.order('name ASC')
		@orders = Order.order('id ASC')
    @order_supplier = OrderSupplier.new({:order_id => @order.id})
  end

  # GET /order_suppliers/1/edit
  def edit
		@suppliers = Supplier.order('name ASC')
  end

  # POST /order_suppliers
  # POST /order_suppliers.json
  def create
    @order_supplier = OrderSupplier.new(order_supplier_params)

    respond_to do |format|
      if @order_supplier.save
        format.html { redirect_to @order_supplier, notice: 'Order supplier was successfully created.' }
        format.json { render :show, status: :created, location: @order_supplier }
      else
        format.html { render :new }
        format.json { render json: @order_supplier.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /order_suppliers/1
  # PATCH/PUT /order_suppliers/1.json
  def update
    respond_to do |format|
      if @order_supplier.update(order_supplier_params)
        format.html { redirect_to order_suppliers_url(:order_id => @order_supplier.order_id), notice: 'Order supplier was successfully updated.' }
      format.json { head :no_content }
      else
        format.html { render :edit }
        format.json { render json: @order_supplier.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /order_suppliers/1
  # DELETE /order_suppliers/1.json
  def destroy
    @order_supplier.destroy
    respond_to do |format|
      format.html { redirect_to order_suppliers_url(:order_id => @order_supplier.order_id), notice: 'Order supplier was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order_supplier
      @order_supplier = OrderSupplier.find(params[:id])
    end

    def find_order
			if params[:order_id]
	      @order = Order.find(params[:order_id])
			end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def order_supplier_params
      params.require(:order_supplier).permit(:order_id, :supplier_id, :group_id, :position)
    end
end
