class Staff < ApplicationRecord
  has_many :entries, dependent: :destroy
  has_many :projects, through: :entries
  belongs_to :organization
end
