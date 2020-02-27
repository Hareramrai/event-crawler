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
require 'rails_helper'

RSpec.describe Parser, type: :model do

  describe 'validations' do
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:url) }
    it { should validate_presence_of(:description) }
    it { should validate_presence_of(:host) }
    it { should validate_presence_of(:path) }
  end

  describe '#endpoint' do
    subject { build(:parser) }

    it { expect(subject.endpoint).to eq(subject.host + subject.path) }
  end
end
