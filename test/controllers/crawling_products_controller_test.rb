require 'test_helper'

class CrawlingProductsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @crawling_product = crawling_products(:one)
  end

  test "should get index" do
    get crawling_products_url
    assert_response :success
  end

  test "should get new" do
    get new_crawling_product_url
    assert_response :success
  end

  test "should create crawling_product" do
    assert_difference('CrawlingProduct.count') do
      post crawling_products_url, params: { crawling_product: { cost: @crawling_product.cost, image_url: @crawling_product.image_url, product_info: @crawling_product.product_info, product_name: @crawling_product.product_name } }
    end

    assert_redirected_to crawling_product_url(CrawlingProduct.last)
  end

  test "should show crawling_product" do
    get crawling_product_url(@crawling_product)
    assert_response :success
  end

  test "should get edit" do
    get edit_crawling_product_url(@crawling_product)
    assert_response :success
  end

  test "should update crawling_product" do
    patch crawling_product_url(@crawling_product), params: { crawling_product: { cost: @crawling_product.cost, image_url: @crawling_product.image_url, product_info: @crawling_product.product_info, product_name: @crawling_product.product_name } }
    assert_redirected_to crawling_product_url(@crawling_product)
  end

  test "should destroy crawling_product" do
    assert_difference('CrawlingProduct.count', -1) do
      delete crawling_product_url(@crawling_product)
    end

    assert_redirected_to crawling_products_url
  end
end
