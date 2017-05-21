class AddDiscountInfoToCrawlingProduct < ActiveRecord::Migration[5.0]
  def change
    add_column :crawling_products, :discount_per, :string
    add_column :crawling_products, :discount_cost, :string

  end
end
