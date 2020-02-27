require 'rails_helper'

RSpec.describe PageScraper do
  let(:parser) { create(:parser) }
  let(:url) { 'https://test.com'}

  subject { described_class.new(url, parser) }

  before do
    Timecop.freeze(Time.now)
  end

  after do
    Timecop.return
  end

  describe '#call' do
    let(:html_page) { file_fixture('download.html').read }

    before do
      allow(HTTParty).to receive(:get).and_return(html_page)
    end

    it 'returns crawled events from the page' do
      crawled_events = [
        {
          category: 'Teens',
          description: 'Time 11:00–16:30 Age 14–17 Participation fee 50 Euro incl. Snack . reduced fee possible Registration Frauke Menzinger . education@co-berlin.org Team Yvonne Most and Isabel SebeikatAll workshop are held in German.',
          end_time: '2020-03-29T00:00:00+01:00',
          event_url: 'https://www.co-berlin.org/en/education/teens/polaroid-diaries',
          last_crawled_at: Time.now,
          marked_as_deleted: false,
          start_time: '2020-03-28T00:00:00+01:00',
          sub_title: 'Das Besondere im Alltäglichen',
          title: 'Polaroid Diaries',
          web_resource_id: parser.web_resource_id
        }
      ]

      expect(subject.call).to eq(crawled_events)
    end
  end
end
