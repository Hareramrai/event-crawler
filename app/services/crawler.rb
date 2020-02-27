class Crawler
  def initialize(web_resource)
    @web_resource = web_resource
    @parser = web_resource.parser
  end

  def call
    web_resource.web_resource_crawler_statuses.delete_all

    pages.each do |page_link|
      PageCrawlerJob.perform_later(page_link, web_resource.id)
    end
  end


  private

  attr_reader :web_resource, :parser

  def pages
    Spider.new(parser).page_links
  end
end
