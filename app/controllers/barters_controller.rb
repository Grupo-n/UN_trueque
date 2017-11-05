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

    @qr = @barter.get_QR

    @pone = @barter.get_product_one
    @ptwo = @barter.get_product_two

    @ven = @pone.get_user
    @com = @ptwo.get_user

    respond_to do |format|
      format.html
      format.pdf{render template:"pdf/facture", pdf: "facture"}
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
    @product = @barter.get_product_one
    @user = @product.get_user
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
      format.html { redirect_to barters_url, notice: 'Barter was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_barter
      @barter = Barter.find(params[:id])
    end

    def barter_params
      params.require(:barter).permit(:description, :product_one_id, :product_two_id, :state, :confirmation, :id_one_user, :id_two_user, :latitude, :longitude, :address)
    end

end
