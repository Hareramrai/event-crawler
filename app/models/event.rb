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
class Event < ApplicationRecord

  #validations
  validates :title, :event_url, :description, presence: true
  validates :event_url, uniqueness: { scope: :web_resource_id }

  belongs_to :web_resource

  delegate :name, to: :web_resource, prefix: true
end
