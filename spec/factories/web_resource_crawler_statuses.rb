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
FactoryBot.define do
  factory :web_resource_crawler_status do
    url { "MyString" }
    status { "MyString" }
    status_at { "2020-02-24 22:33:30" }
    last_crawled_events_count { 1 }
    marked_as_deleted { false }
    web_resource { nil }
  end
end
