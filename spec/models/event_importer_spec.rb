require 'rails_helper'

RSpec.describe EventImporter, type: :model do
  let(:web_resource) { create(:web_resource) }

  let(:crawler_events) do
    [
      attributes_for(:event, web_resource_id: web_resource.id),
      attributes_for(:event, web_resource_id: web_resource.id)
    ]
  end

  describe '.import' do

    it 'imports the events & returns number of upsert' do
      expect(EventImporter.import(crawler_events)).to eq(2)
      expect(web_resource.events.count).to eq(2)
    end
  end

end
