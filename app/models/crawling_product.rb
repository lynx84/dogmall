class CrawlingProduct < ApplicationRecord

  def self.product_crawling
    require 'nokogiri'
    require 'open-uri'

    url = 'http://pettopet.co.kr/shop/list.php?ca_id=60'
    doc = Nokogiri::HTML(doc = open(url))

    doc.css('div.item a').each do |child|

      begin
        crawling_hash = {
            'product_url' => 'http://pettopet.co.kr' + child['href'],
            'image_url' => child.css('p img')[0]['src'],
            'product_name' => child.css('div.item_con dl dt').text,
            'cost' => child.css('span.price_after').text,
            'product_info' => child.css('div.item_con dl dd').text,
            'discount_cost' => child.css('span.price_before').text,
            'discorunt_per' => child.css('span.discount_val').text

        }
        geneate_crawling_product(crawling_hash)

      rescue => e
        puts e.to_json
        next
      end
    end
  end


  def self.geneate_crawling_product(crawling_hash)
    crawling = CrawlingProduct.new(
        :product_url => crawling_hash['product_url'],
        :image_url => crawling_hash['image_url'],
        :product_name => crawling_hash['product_name'],
        :cost => crawling_hash['cost'],
        :product_info => crawling_hash['product_info'],
        :discount_cost => crawling_hash['discount_cost'],
        :discount_per => crawling_hash['discorunt_per']
    )
    crawling.save
  end

end
