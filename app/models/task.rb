class Task < ApplicationRecord
  has_many :organization_tasks
  has_many :entries,                    through: :organization_tasks
  has_many :projects, -> { distinct },  through: :entries
  has_many :staff, -> { distinct.group 'organization_id' }, through: :entries
end
