require 'rails_helper'

RSpec.describe EventTime, type: :model do
  describe '#date_time' do

    subject { EventTime.new(date_time_string) }

    context 'when in perfect format' do
      let(:date_time_string) { '2020-03-28T00:00:00+01:00' }

      it 'returns correct format datetime' do
        expect { DateTime.parse(subject.date_time) }.to_not raise_error
      end
    end

    context 'when has some chars' do
      let(:date_time_string) { 'Tuesday 25.02.2020 start 20:00' }

      it 'returns correct format datetime' do
        expect { DateTime.parse(subject.date_time) }.to_not raise_error
      end
    end
  end
end
