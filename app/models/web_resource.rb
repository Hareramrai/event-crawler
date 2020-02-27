# == Schema Information
#
# Table name: web_resources
#
#  id                :bigint           not null, primary key
#  marked_as_deleted :boolean          default("false")
#  name              :string
#  url               :string
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#
class WebResource < ApplicationRecord

  #validations
  validates :name, :url, presence: true

  #relations
  has_many :web_resource_crawler_statuses
  has_many :events
  has_one :parser
end
