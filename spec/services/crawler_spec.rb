require 'rails_helper'

RSpec.describe Crawler do
  let(:web_resource) { create(:web_resource)}
  let!(:parser) { create(:parser, web_resource: web_resource) }

  subject { described_class.new(web_resource) }

  describe '#call' do
    let(:html_page) { file_fixture('download.html').read }

    before do
      allow(HTTParty).to receive(:get).and_return(html_page)
    end

    let(:page1) { 'https://www.co-berlin.org/en/calender' }
    let(:page2) { 'https://www.co-berlin.org/en/calender?page=1'}

    it 'invokes the page crawler job with given params' do
      expect(PageCrawlerJob).to receive(:perform_later).with(page1, web_resource.id)
      expect(PageCrawlerJob).to receive(:perform_later).with(page2, web_resource.id)

      subject.call
    end
  end
end
