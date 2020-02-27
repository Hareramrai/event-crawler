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
class Parser < ApplicationRecord

  #validations
  validates :title, :url, :description, :host, :path, presence: true

  belongs_to :web_resource

  def endpoint
    host + path
  end
end
