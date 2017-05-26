class Collaboration < ApplicationRecord
  has_many :projects,       dependent: :destroy
  has_many :entries,        through: :projects, dependent: :destroy
  has_many :organizations,  through: :projects
  has_many :staff, -> { distinct.group 'organization_id' }, through: :entries
  has_many :tasks, -> { distinct },                         through: :projects

  def update_data_from_api(data = nil)
    projects.each { |proj| proj.update_data_from_api }
  end

  def update_entries_from_api
    projects.each { |proj| proj.update_entries_from_api }
  end
end
