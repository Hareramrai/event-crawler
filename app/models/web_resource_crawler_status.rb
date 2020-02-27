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
class WebResourceCrawlerStatus < ApplicationRecord
  belongs_to :web_resource

  include AASM

  validates :url, :status, presence: true

  aasm column: :status do
    state :pending, initial: true
    state :running, :completed, :failed

    event :run do
      transitions from: %I[pending failed completed], to: :running
    end

    event :complete do
      transitions from: :running, to: :completed
    end

    event :fail do
      transitions from: :running, to: :failed
    end
  end

end
