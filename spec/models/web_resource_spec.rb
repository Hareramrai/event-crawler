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
require 'rails_helper'

RSpec.describe WebResource, type: :model do

  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:url) }
  end

end
