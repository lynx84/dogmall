class CreateCrawlingProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :crawling_products do |t|
      t.string :product_url, unique: true
      t.string :product_name
      t.string :image_url
      t.string :cost
      t.string :product_info

      t.timestamps
    end

    add_index :crawling_products, :product_url, unique: true
  end
end
