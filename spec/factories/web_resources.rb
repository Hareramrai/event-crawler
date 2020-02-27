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
FactoryBot.define do
  factory :web_resource do
    name { "MyString" }
    url { "MyString" }
    marked_as_deleted { false }
  end
end
