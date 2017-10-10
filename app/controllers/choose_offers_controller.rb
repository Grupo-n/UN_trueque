class ChooseOffersController < ApplicationController
  before_action :set_choose_offer, only: [:show, :edit, :update, :destroy]

  # GET /choose_offers
  # GET /choose_offers.json
  def index
    @choose_offers = ChooseOffer.all
  end

  # GET /choose_offers/1
  # GET /choose_offers/1.json
  def show
  end

  # GET /choose_offers/new
  def new
    @choose_offer = ChooseOffer.new
  end

  # GET /choose_offers/1/edit
  def edit
  end

  # POST /choose_offers
  # POST /choose_offers.json
  def create
    @choose_offer = ChooseOffer.new(choose_offer_params)

    respond_to do |format|
      if @choose_offer.save
        format.html { redirect_to @choose_offer, notice: 'Choose offer was successfully created.' }
        format.json { render :show, status: :created, location: @choose_offer }
      else
        format.html { render :new }
        format.json { render json: @choose_offer.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /choose_offers/1
  # PATCH/PUT /choose_offers/1.json
  def update
    respond_to do |format|
      if @choose_offer.update(choose_offer_params)
        format.html { redirect_to @choose_offer, notice: 'Choose offer was successfully updated.' }
        format.json { render :show, status: :ok, location: @choose_offer }
      else
        format.html { render :edit }
        format.json { render json: @choose_offer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /choose_offers/1
  # DELETE /choose_offers/1.json
  def destroy
    @choose_offer.destroy
    respond_to do |format|
      format.html { redirect_to choose_offers_url, notice: 'Choose offer was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_choose_offer
      @choose_offer = ChooseOffer.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def choose_offer_params
      params.fetch(:choose_offer, {})
    end
end
