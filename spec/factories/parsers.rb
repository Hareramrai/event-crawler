# == Schema Information
#
# Table name: parsers
#
#  id                   :bigint           not null, primary key
#  category             :string
#  description          :string
#  end_time             :string
#  event_list_container :string
#  host                 :string
#  marked_as_deleted    :boolean          default("false")
#  pagination           :string
#  path                 :string
#  start_time           :string
#  sub_title            :string
#  title                :string
#  url                  :string
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#  web_resource_id      :bigint
#
# Indexes
#
#  index_parsers_on_web_resource_id  (web_resource_id)
#
# Foreign Keys
#
#  fk_rails_...  (web_resource_id => web_resources.id)
#
FactoryBot.define do
  factory :parser do
    web_resource
    host { 'https://www.co-berlin.org' }
    path { '/en/calender' }
    event_list_container { '/html/body/div/div/div' }
    url { './a/@href' }
    title { './a/div[@class="article-title"]' }
    sub_title { './a/div[@class="article-subtitle"]' }
    category  { './a/div[1]/span[1]' }
    start_time { './a/div[1]/span[2]/div/span[1]/@content' }
    end_time { './a/div[1]/span[2]/div/span[2]/@content' }
    description { './a/div[@class="article-text"]' }
    pagination { '/html/body/div/div/ul/li/a/@href' }
  end
end
