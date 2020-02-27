require 'rails_helper'

RSpec.describe Spider, type: :model do
  let(:parser) { create(:parser) }

  subject { described_class.new(parser) }

  describe '#page_links' do
    let(:html_page) { file_fixture('download.html').read }

    before do
      allow(HTTParty).to receive(:get).and_return(html_page)
    end

    it 'returns page_links from the page' do
      result_links = %w[
        https://www.co-berlin.org/en/calender?page=1
        https://www.co-berlin.org/en/calender
      ]
      expect(subject.page_links).to eq(result_links)
    end
  end
end
