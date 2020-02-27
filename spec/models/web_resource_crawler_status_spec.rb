# == Schema Information
#
# Table name: web_resource_crawler_statuses
#
#  id                        :bigint           not null, primary key
#  last_crawled_events_count :integer
#  marked_as_deleted         :boolean          default("false")
#  status                    :string
#  status_at                 :datetime
#  url                       :string
#  created_at                :datetime         not null
#  updated_at                :datetime         not null
#  web_resource_id           :bigint
#
# Indexes
#
#  index_web_resource_crawler_statuses_on_web_resource_id  (web_resource_id)
#
# Foreign Keys
#
#  fk_rails_...  (web_resource_id => web_resources.id)
#
require 'rails_helper'

RSpec.describe WebResourceCrawlerStatus, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:url) }
    it { should validate_presence_of(:status) }
  end

  describe 'state management' do

    it 'state change on run' do
      expect(subject).to transition_from(:pending).to(:running).on_event(:run)
      expect(subject).to transition_from(:failed).to(:running).on_event(:run)
      expect(subject).to transition_from(:completed).to(:running).on_event(:run)
    end

    it 'state change on fail' do
      expect(subject).to transition_from(:running).to(:failed).on_event(:fail)
    end

    it 'state change on complete' do
      expect(subject).to transition_from(:running).to(:completed).on_event(:complete)
    end
  end
end
