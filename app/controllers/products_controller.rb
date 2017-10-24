class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy, :offer]

  # GET /products
  # GET /products.json

  def index
    @products = Product.all
    @products = Product.paginate(:page => params[:page], :per_page => 9)
    #@search = Product.search(params[:q])
    #@products = @search.result.paginate(:page => params[:page], :per_page => 9)
  end

  def offer
    @barter = Barter.new
    @myproducts = current_user.products.all
    if params[:offert] != nil
      @offert = Product.find(params[:offert])
    else
      @offert = Product.new
    end
  end

  # GET /products/1
  # GET /products/1.json
  def show
    @x=User.joins(:products).select("products.id,first_name,last_name,name,p_type,description").where("products.id = ?", @product.id)
  end

  # GET /products/new
  def new
    @product = Product.new
  end

  # GET /products/1/edit
  def edit
  end

  # POST /products
  # POST /products.json
  def create
    @product = Product.new(product_params)

    respond_to do |format|
      @product.user = current_user
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
        format.json { render :show, status: :ok, location: @product }
      else
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
      format.html { redirect_to products_url, notice: 'Product was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def product_params
      params.require(:product).permit(:product_image, :name, :p_type, :description, :offert)
    end

end
