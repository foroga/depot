class OrdersController < ApplicationController
  before_action :set_order, only: [:show, :edit, :update, :destroy, :open]

  # GET /orders
  # GET /orders.json
  def index
    @orders = Order.all.order('id DESC')
  end

  # GET /orders/1
  # GET /orders/1.json
  def show
  end

  # GET /orders/new
  def new
    @order = Order.new
  end

  # GET /orders/1/edit
  def edit
  end

  # POST /orders
  # POST /orders.json
  def create
    @order = Order.new(order_params)

    respond_to do |format|
      if @order.save
        format.html { redirect_to @order, notice: 'Order was successfully created.' }
        format.json { render :show, status: :created, location: @order }
      else
        format.html { render :new }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /orders/1
  # PATCH/PUT /orders/1.json
  def update
    respond_to do |format|
      if @order.update(order_params)
        format.html { redirect_to @order, notice: 'Order was successfully updated.' }
        format.json { render :show, status: :ok, location: @order }
      else
        format.html { render :edit }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /orders/1
  # DELETE /orders/1.json
  def destroy
    @order.destroy
    respond_to do |format|
      format.html { redirect_to orders_url, notice: 'Order was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  # OPEN /orders/1
  # OPEN /orders/1.json
  def open
		@suppliers=OrderSupplier.select(:supplier_id).where(:order_id=>params[:id])
		@products=Product.where(supplier_id: @suppliers, :active => true)
		@products.each do |product|
			if Item.where(:product_id=>product.id, :order_id=>params[:id]).exists?
				logger.debug(product.name)
			else
				@item=Item.new()
				@item.order_id=params[:id]
				@item.product_id=product.id
				@item.supplier_id=product.supplier_id
				@item.name=product.name
				@item.note=product.note
				@item.minall=product.minall
				@item.mingroup=product.mingroup
				@item.kgxunit=product.kgxunit
				@item.unittype=product.unittype
				@item.price=product.price
				@item.save
				logger.debug(product.name+ 'new')
			end
		end
		if @order.state!='Open'
			@order.state='Open'
			if @order.save
	      format.html { redirect_to orders_url, notice: 'Order was successfully destroyed.' }
	      format.json { head :no_content }
			end
		end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order
      @order = Order.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def order_params
      params.require(:order).permit(:state, :date, :requested, :received, :priceini, :priceend)
    end
end
