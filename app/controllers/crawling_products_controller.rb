class CrawlingProductsController < ApplicationController
  before_action :set_crawling_product, only: [:show, :edit, :update, :destroy]

  # GET /crawling_products
  # GET /crawling_products.json
  def index
    @crawling_products = CrawlingProduct.all
  end

  # GET /crawling_products/1
  # GET /crawling_products/1.json
  def show
  end

  # GET /crawling_products/new
  def new
    @crawling_product = CrawlingProduct.new
  end

  # GET /crawling_products/1/edit
  def edit
  end

  # POST /crawling_products
  # POST /crawling_products.json
  def create
    @crawling_product = CrawlingProduct.new(crawling_product_params)

    respond_to do |format|
      if @crawling_product.save
        format.html { redirect_to @crawling_product, notice: 'Crawling product was successfully created.' }
        format.json { render :show, status: :created, location: @crawling_product }
      else
        format.html { render :new }
        format.json { render json: @crawling_product.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /crawling_products/1
  # PATCH/PUT /crawling_products/1.json
  def update
    respond_to do |format|
      if @crawling_product.update(crawling_product_params)
        format.html { redirect_to @crawling_product, notice: 'Crawling product was successfully updated.' }
        format.json { render :show, status: :ok, location: @crawling_product }
      else
        format.html { render :edit }
        format.json { render json: @crawling_product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /crawling_products/1
  # DELETE /crawling_products/1.json
  def destroy
    @crawling_product.destroy
    respond_to do |format|
      format.html { redirect_to crawling_products_url, notice: 'Crawling product was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_crawling_product
      @crawling_product = CrawlingProduct.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def crawling_product_params
      params.require(:crawling_product).permit(:product_url, :product_name, :image_url, :cost, :product_info, :discount_per, :discount_cost)
    end
end
