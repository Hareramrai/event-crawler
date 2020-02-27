# == Schema Information
#
# Table name: events
#
#  id                :bigint           not null, primary key
#  category          :string
#  description       :string
#  end_time          :datetime
#  event_url         :string
#  last_crawled_at   :datetime
#  marked_as_deleted :boolean          default("false")
#  start_time        :datetime
#  sub_title         :string
#  title             :string
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  web_resource_id   :bigint
#
# Indexes
#
#  index_events_on_web_resource_id                (web_resource_id)
#  index_events_on_web_resource_id_and_event_url  (web_resource_id,event_url) UNIQUE
#
# Foreign Keys
#
#  fk_rails_...  (web_resource_id => web_resources.id)
#
require 'rails_helper'

RSpec.describe Event, type: :model do
  describe 'validations' do
    it { should validate_uniqueness_of(:event_url).scoped_to(:web_resource_id) }
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:description) }
    it { should validate_presence_of(:event_url) }
  end

end
