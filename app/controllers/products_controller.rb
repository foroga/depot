class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy]
	before_action :find_supplier

  # GET /products
  # GET /products.json
  def index
		if @supplier
	    @products = @supplier.products
		else
	    @products = Product.all
		end
  end

  # GET /products/1
  # GET /products/1.json
  def show
  end

  # GET /products/new
  def new
		@suppliers = Supplier.order('name ASC')
    @product = Product.new({:supplier_id => @supplier.id})
  end

  # GET /products/1/edit
  def edit
		@suppliers = Supplier.order('name ASC')
  end

  # POST /products
  # POST /products.json
  def create
    @product = Product.new(product_params)

    respond_to do |format|
      if @product.save
        format.html { redirect_to @product, notice: 'Product was successfully created.' }
        format.json { render :show, status: :created, location: @product }
      else
        format.html { render :new }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /products/1
  # PATCH/PUT /products/1.json
  def update
    respond_to do |format|
      if @product.update(product_params)
        format.html { redirect_to @product, notice: 'Product was successfully updated.' }
        format.json { render :show,  :supplier_id => @product.supplier_id, status: :ok, location: @product }
      else
				@suppliers = Supplier.order('name ASC')
        format.html { render :edit }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /products/1
  # DELETE /products/1.json
  def destroy
    @product.destroy
    respond_to do |format|
      format.html { redirect_to products_url(:supplier_id => @product.supplier_id),  notice: 'Product was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params[:id])
    end

		def find_supplier
			if params[:supplier_id]
				 @supplier = Supplier.find(params[:supplier_id])
			end
		end

    # Never trust parameters from the scary internet, only allow the white list through.
    def product_params
      params.require(:product).permit(:supplier_id, :name, :imageurl, :active, :note, :minall, :mingroup, :minunit, :kgxunit, :unittype, :price, :priceold)
    end
end
