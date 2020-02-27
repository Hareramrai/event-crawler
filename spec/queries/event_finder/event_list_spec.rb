require 'rails_helper'

RSpec.describe EventFinder::EventList, type: :model do
  let(:web_resource) { create(:web_resource) }
  let(:today) { DateTime.now }

  let!(:event1) do
    create(
      :event,
      title: 'test123',
      start_time: today
    )
  end

  let!(:event2) do
    create(:event, start_time: today + 2.days, web_resource: web_resource)
  end

  let(:initial_scope) { Event.includes(:web_resource) }

  subject { described_class.new(initial_scope).call(params) }

  context 'with empty params' do
    let(:params) { {} }

    it 'returns all events' do
      expect(subject.count).to eq(Event.count)
    end
  end

  context 'with search params' do
    let(:params) { { search: 'est12' } }

    it 'returns events based on title search' do
      expect(subject).to eq([event1])
    end
  end

  context 'with date_range params' do
    let(:date_string) { today.strftime('%Y/%m/%d') }
    let(:params) { { date_range: "#{date_string}-#{date_string}" } }

    it 'returns events based on date_range' do
      expect(subject).to eq([event1])
    end
  end

  context 'with web_resource params' do
    let(:params) { { web_resource: web_resource.id } }

    it 'returns events based on web_resource' do
      expect(subject).to eq([event2])
    end
  end

end
