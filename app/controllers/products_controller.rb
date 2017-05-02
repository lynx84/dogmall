class ProductsController < ApplicationController
  def products

    crawling_products = CrawlingProduct.all

    render :json => crawling_products
  end
end
