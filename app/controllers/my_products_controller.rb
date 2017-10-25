class MyProductsController < ApplicationController
  before_action :set_product, only: [:offer]
  before_action :set_barter, only: [:accept]

  def index
    @user = current_user
    @products = current_user.products.all.paginate(:page => params[:page], :per_page => 12)
  end

  def myobjects
    @products = current_user.products.objects().paginate(:page => params[:page], :per_page => 12)
  end

  def myservices
    @products = current_user.products.services().paginate(:page => params[:page], :per_page => 12)
  end

  def offer
    @barters = Barter.offers(@product).paginate(:page => params[:page], :per_page => 12)
  end

  def mytransactions
   @barters = Barter.all
  end

  def accept

  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def product_params
      params.require(:product).permit(:product_image, :name, :p_type, :description)
    end

    def set_barter
      @barter = Barter.find(params[:id])
    end

    def barter_params
      params.require(:barter).permit(:product_one_id, :product_two_id, :description, :state)
    end

end
