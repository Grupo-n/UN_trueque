require 'digest/md5'
#require 'rqrcode'

class BartersController < ApplicationController
  before_action :set_barter, only: [:show, :edit, :update, :destroy]

  # GET /barters
  # GET /barters.json
  def index
    @barters = Barter.all
  end

  # GET /barters/1
  # GET /barters/1.json
  def show
    @pone = Product.find(@barter.product_one_id)
    @ptwo = Product.find(@barter.product_two_id)
    @barter = Barter.find(params[:id])
    @hashcode = Digest::MD5.hexdigest(@pone.id.to_s+"-"+@ptwo.id.to_s)
    @qr = RQRCode::QRCode.new(@hashcode.to_s)

    @pr1=Product.find(@barter.product_one_id)
    @pr2=Product.find(@barter.product_two_id)
    @ven=User.find(@pr1.user_id)
    @com=User.find(@pr2.user_id)


    respond_to do |format|
      format.html
      format.pdf{render template:
      "pdf/facture", pdf: "facture"}
    end
  end

  # GET /barters/new
  def new
    @barter = Barter.new
  end

  # GET /barters/1/edit
  def edit
  end

  # POST /barters
  # POST /barters.json
  def create
    @barter = Barter.new(barter_params)
    @product = Product.get_user_by_product_id(@barter.product_one_id)
    @user = User.get_user(@product)
    @userbarters = current_user
    respond_to do |format|
      if @barter.save
        UserMailer.new_barter(@barter, @product, @user, @userbarters).deliver
        format.html { redirect_to root_path, notice: '¡Oferta realizada!' }
        format.json { render :show, status: :created, location: @barter }
      else
        format.html { render :new }
        format.json { render json: @barter.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /barters/1
  # PATCH/PUT /barters/1.json
  def update
    respond_to do |format|
      if @barter.update(barter_params)
        format.html { redirect_to user_home_path, notice: 'La oferta ha sido aceptada' }
        format.json { render :show, status: :ok, location: @barter }
      else
        format.html { render :edit }
        format.json { render json: @barter.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /barters/1
  # DELETE /barters/1.json
  def destroy
    @barter.destroy
    respond_to do |format|
      format.html { redirect_to user_home_path, notice: 'La oferta ha sido cancelada.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_barter
      @barter = Barter.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def barter_params
      params.require(:barter).permit(:description, :product_one_id, :product_two_id, :state, :confirmation, :id_one_user, :id_two_user, :latitude, :longitude, :address)
      #params.require(:barter).permit(:description, :product_one_id, :product_two_id, :title, :address)
    end

end
