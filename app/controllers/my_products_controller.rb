class MyProductsController < ApplicationController
  before_action :set_product, only: [:offer]
  before_action :set_barter, only: [:accept, :succesfull_transaction, :generate_barter_pdf]

  def index
    @user = current_user
    @products = current_user.products.descendent.paginate(:page => params[:page], :per_page => 12)
  end

  def myobjects
    @products = current_user.products.objects.paginate(:page => params[:page], :per_page => 12)
  end

  def myservices
    @products = current_user.products.services.paginate(:page => params[:page], :per_page => 12)
  end

  def offer
    @barters = Barter.offers(@product).paginate(:page => params[:page], :per_page => 12)
  end

  def mytransactions
   @barters = Barter.my_transactions(current_user)
  end

  def accept
    @user = current_user
    @comment = Comment.new
    @comments = @barter.get_comments
    @product_one = @barter.get_product_one
    @product_two = @barter.get_product_two
  end

  def offers_received
    @barters = Barter.offers_received(current_user)
  end

  def offers_made
    @barters = Barter.offers_made(current_user)
  end

  def profile_information

    @user = current_user
    @proandserv = current_user.products.descendent.paginate(:page => params[:page], :per_page => 12)
    @products = current_user.products.objects.paginate(:page => params[:page], :per_page => 12)
    @services = current_user.products.services.paginate(:page => params[:page], :per_page => 12)
    @barters = Barter.my_transactions(current_user)
    @bartersreceived = Barter.offers_received(current_user)
    @bartersmade = Barter.offers_made(current_user)

  end

  def succesfull_transaction
    @pone = Product.find(@barter.product_one_id)
    @ptwo = Product.find(@barter.product_two_id)
    @user_one = User.get_user(@pone)
    @user_two = User.get_user(@ptwo)
  end


  def generate_barter_pdf

        @qr = @barter.get_QR

        @pone = @barter.get_product_one
        @ptwo = @barter.get_product_two

        @ven = @pone.get_user
        @com = @ptwo.get_user

        respond_to do |format|
          format.html
          format.pdf{render template:"pdf/facture", pdf: @barter.get_Hash.to_s}
        end

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
