require 'digest/md5'
#require 'rqrcode'

class BartersController < ApplicationController
  before_action :set_barter, only: [:show, :edit, :update, :destroy, :change_ubication, :score]

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


  def score
    @pone = @barter.get_product_one
    @ptwo = @barter.get_product_two
    @ven = @pone.get_user
    @com = @ptwo.get_user
  end


  # GET /barters/1/edit
  def edit
  end

  def change_ubication
    @barter = Barter.find(params[:id])
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
        @barter.hash_facture = @barter.get_Hash.to_s
        @barter.save
        format.html { redirect_to root_path, notice: '¡Oferta realizada!' }
        format.json { render :show, status: :created, location: @barter }
      else
        format.html { redirect_to offer_product_path(@product), notice: @barter.errors }
        format.json { render json: @barter.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /barters/1
  # PATCH/PUT /barters/1.json
  def update
    respond_to do |format|
      if @barter.update(barter_params)
        if @barter.accept_user_one == 'false' and @barter.accept_user_two == 'false'
          format.html { redirect_to accept_my_product_path(@barter), notice: 'Has cambiado la ubicación o hora de la oferta'}
          format.json { render accept_my_product_path(@barter), status: :ok, location: @barter }
        elsif @barter.accept_user_one == 'true' and @barter.accept_user_two == 'true'
          @barter.make_transaction
          UserMailer.acceptoffer_email(@barter, @barter.get_user_one, @barter.get_user_two).deliver
          SendMailersJob.set(wait: 30.seconds).perform_later(@barter, @user_one, @user_two)
          format.html { redirect_to succesfull_transaction_my_product_path(@barter), notice: 'Transaccion exitosa'}
          format.json { render :show, status: :ok, location: @barter }
        else
          format.html { redirect_to user_home_path, notice: 'Has aceptado la oferta, el otro usuario debe confirmar'}
          format.json { render user_home_path, status: :ok, location: @barter }
        end
      else
        format.html { redirect_to change_ubication_barter_path(@barter), notice: @barter.errors }
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
    def set_barter
      @barter = Barter.find(params[:id])
    end

    def barter_params
      params.require(:barter).permit(:description, :product_one_id, :product_two_id, :state, :confirmation, :id_one_user, :id_two_user, :accept_user_one, :accept_user_two, :meeting_date, :meeting_time, :latitude, :longitude
)
      #params.require(:barter).permit(:description, :product_one_id, :product_two_id, :title, :address)
    end

    def barter_params_ubication
      params.require(:barter).permit(:accept_user_one,:accept_user_two,:latitude, :longitude)
      #params.require(:barter).permit(:description, :product_one_id, :product_two_id, :title, :address)
    end

end
