class PageCrawlerJob < ApplicationJob
  queue_as :default

  def perform(page_url, web_resource_id)
    web_resource = WebResource.find web_resource_id
    crawler_status = web_resource
                      .web_resource_crawler_statuses
                      .create(url: page_url, status_at: Time.now)

    crawl(crawler_status, page_url, web_resource.parser)

    crawler_status.save
  end

  private

  def crawl(crawler_status, page_url, parser)
    crawler_status.run

    page_scrapper = PageScraper.new(page_url, parser)
    crawled_events = page_scrapper.call

    crawler_status.last_crawled_events_count = EventImporter.import(crawled_events)

    crawler_status.complete
  rescue Exception => e
    crawler_status.fail
  end
end
