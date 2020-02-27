class Page

  PAGE_METHODS = %W[
    title sub_title category description
  ]

  PAGE_METHODS.each do |method_name|
    define_method(method_name) do
      content_at(parser.public_send method_name.to_sym)
    end
  end

  def initialize(html_page, parser)
    @html_page = html_page
    @parser = parser
  end

  def event_list_container
    html_page.xpath(parser.event_list_container)
  end

  def pagination
    hrefs = html_page.xpath(parser.pagination).map { |link| link.text }.compact

    hrefs
      .map { |href| parser.host + href }
      .push(parser.endpoint)
      .uniq
  end

  def start_time
    return if parser.start_time.blank?

    date_time(parser.start_time)
  end

  def end_time
    return if parser.end_time.blank?

    date_time(parser.end_time)
  end

  def url
    parser.host + content_at(parser.url)
  end

  private

  attr_reader :html_page, :parser

  def content_at(xpath)
    return if xpath.blank?

    html_page.xpath(xpath).text.squish
  end

  def date_time(xpath)
    time_string = html_page.xpath(xpath).text

    EventTime.new(time_string).date_time
  end
end
