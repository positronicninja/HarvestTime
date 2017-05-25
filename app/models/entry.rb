class Entry < ApplicationRecord
  belongs_to :staff
  belongs_to :project
  has_one :organization, through: :project
end
