class Project < ApplicationRecord
  has_many :entries, dependent: :destroy
  has_many :staff, -> { distinct.group 'organization_id' }, through: :entries
  belongs_to :organization
end
