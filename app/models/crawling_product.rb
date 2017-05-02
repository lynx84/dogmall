class CrawlingProduct < ApplicationRecord

  def self.product_crawling
    require 'nokogiri'
    require 'open-uri'

    url = 'http://pettopet.co.kr/shop/list.php?ca_id=60'
    doc = Nokogiri::HTML(doc = open(url))

    doc.css('div.item a').each do |child|

      begin
        crawling = CrawlingProduct.new(
            :product_url => 'http://pettopet.co.kr' + child['href'],
            :image_url => child.css('p img')[0]['src'],
            :product_name => child.css('div.item_con dl dt').text,
            :cost => child.css('span.price_after').text,
            :product_info => child.css('div.item_con dl dd').text
        )
        crawling.save

        product_url = 'http://pettopet.co.kr' + child['href']
        image_url = child.css('p img')[0]['src']
        product_name =  child.css('div.item_con dl dt').text
        cost = child.css('span.price_after').text
        product_info = child.css('div.item_con dl dd').text

        geneate_crawling_product(product_url, image_url, product_name, cost, product_info)

      rescue => e
        puts e.to_json
        next
      end
    end
  end


  def geneate_crawling_product(product_url, image_url, product_name, cost, product_info)
    crawling = CrawlingProduct.new(
        :product_url => product_url,
        :image_url => image_url,
        :product_name => product_name,
        :cost => cost,
        :product_info => product_info
    )
    crawling.save
  end

end
