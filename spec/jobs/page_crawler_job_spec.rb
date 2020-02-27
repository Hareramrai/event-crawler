require 'rails_helper'

RSpec.describe PageCrawlerJob, type: :job do
  let(:web_resource) { create(:web_resource)}
  let!(:parser) { create(:parser, web_resource: web_resource) }
  let(:page_url) { 'https://www.co-berlin.org/en/calender' }

  subject { described_class.new }

  describe '#perform' do
    let(:html_page) { file_fixture('download.html').read }

    before do
      allow(HTTParty).to receive(:get).and_return(html_page)
    end

    it 'imports the events' do
      expect {
        subject.perform(page_url, web_resource.id)
      }.to change { Event.count }.by(1)
    end
  end
end
