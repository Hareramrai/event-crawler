class Spider
  def initialize(parser)
    @parser = parser
  end

  def page_links
    Page.new(html_page, parser).pagination
  end

  private

  attr_reader :parser

  def html_page
    @html_page ||= Nokogiri::HTML(HTTParty.get(parser.endpoint))
  end
end
