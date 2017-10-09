class MyPublicationsController < ApplicationController
  before_action :set_my_publication, only: [:show, :edit, :update, :destroy]

  # GET /my_publications
  # GET /my_publications.json
  def index
    @my_publications = MyPublication.all
  end

  # GET /my_publications/1
  # GET /my_publications/1.json
  def show
  end

  # GET /my_publications/new
  def new
    @my_publication = MyPublication.new
  end

  # GET /my_publications/1/edit
  def edit
  end

  # POST /my_publications
  # POST /my_publications.json
  def create
    @my_publication = MyPublication.new(my_publication_params)

    respond_to do |format|
      if @my_publication.save
        format.html { redirect_to @my_publication, notice: 'My publication was successfully created.' }
        format.json { render :show, status: :created, location: @my_publication }
      else
        format.html { render :new }
        format.json { render json: @my_publication.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /my_publications/1
  # PATCH/PUT /my_publications/1.json
  def update
    respond_to do |format|
      if @my_publication.update(my_publication_params)
        format.html { redirect_to @my_publication, notice: 'My publication was successfully updated.' }
        format.json { render :show, status: :ok, location: @my_publication }
      else
        format.html { render :edit }
        format.json { render json: @my_publication.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /my_publications/1
  # DELETE /my_publications/1.json
  def destroy
    @my_publication.destroy
    respond_to do |format|
      format.html { redirect_to my_publications_url, notice: 'My publication was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_my_publication
      @my_publication = MyPublication.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def my_publication_params
      params.fetch(:my_publication, {})
    end
end
