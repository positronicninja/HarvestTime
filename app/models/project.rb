class Project < ApplicationRecord
  has_many :entries, dependent: :destroy
  has_many :staff, -> { distinct.group 'organization_id' }, through: :entries
  belongs_to :organization
  belongs_to :collaboration

  def self.update_data_for_project(data: nil, org: nil)
    raise 'Missing Harvest Project Data' if data.nil? || org.nil?
    project = find_or_create_by(organization: org,
                                harvest_id:   data[:id]) do |new_project|
      new_project.name = data[:name]
      new_project.collaboration = Collaboration.find_or_create_by(name: data[:name])
    end
    project.update_data_from_api(data)
  end

  def update_data_from_api(data = nil)
    data ||= organization.harvesting.request.projects.find(harvest_id)
    raise 'Missing Harvest Project Data' if data.nil?
    update(
      name:               data[:name],
      active:             data[:active],
      harvest_starts_on:  data[:starts_on] || data[:created_at],
      harvest_created_at: data[:created_at],
      harvest_updated_at: data[:updated_at]
    )
  end

  def update_entries_from_api
    organization.harvesting.request.reports
                .time_by_project(harvest_id,
                                 harvest_starts_on,
                                 Time.now, {}).each do |entry_data|
      Entry.update_data_for_project(data: entry_data, proj: self)
    end
  end
end
