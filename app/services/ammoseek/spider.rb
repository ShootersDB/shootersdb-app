module Ammoseek
  class Spider < Kimurai::Base
    @name = 'ammoseek_spider'
    @engine = :mechanize

    def self.process(url)
      @start_urls = [url]
      self.crawl!
    end

    def parse(response, url:, data: {})
      cost_range_node = response.css('.results-cost-range .results-info-content').first
      # TODO: handle when no cost_range found
      low_price = string_to_money(cost_range_node.attributes['data-lowprice'].value)
    end

    private

    def string_to_money(string)
      Money.new(string.to_f * 100)
    end
  end
end
