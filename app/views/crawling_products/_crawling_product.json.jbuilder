json.extract! crawling_product, :id, :product_name, :image_url, :cost, :product_info, :created_at, :updated_at
json.url crawling_product_url(crawling_product, format: :json)
