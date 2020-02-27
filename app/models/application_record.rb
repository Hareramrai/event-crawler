class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
  scope :undeleted, -> { where(marked_as_deleted: false) }
end
