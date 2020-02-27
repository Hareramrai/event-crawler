class PageScraper
  def initialize(url, parser)
    @url = url
    @parser = parser
  end

  def call
    events.map { |event| event_attributes(event) }
  end

  private

  attr_reader :url, :parser

  def html_page
    @html_page ||= Nokogiri::HTML(HTTParty.get(url))
  end

  def events
    @events ||= Page.new(html_page, parser).event_list_container
  end

  def event_attributes(event)
    event_page = Page.new(event, parser)

    {
      title: event_page.title,
      sub_title: event_page.sub_title,
      category: event_page.category,
      start_time: event_page.start_time,
      end_time: event_page.end_time,
      description: event_page.description,
      event_url: event_page.url,
      web_resource_id: parser.web_resource_id,
      marked_as_deleted: false,
      last_crawled_at: Time.now
    }
  end
end
