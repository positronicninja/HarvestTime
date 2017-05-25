class Entry < ApplicationRecord
  belongs_to :staff
  belongs_to :project
  has_one :organization, through: :project

  def self.update_data_for_project(data: nil, proj: nil)
    raise 'Missing Harvest Entry Data' if data.nil? || proj.nil?
    entry = find_or_create_by(project:    proj,
                              harvest_id: data[:id]) do |new_entry|
      new_entry.staff = Staff.find_or_create_by(harvest_id: data[:user_id],
                                                organization: proj.organization)
    end
    entry.update_data_from_api(data)
  end

  def update_data_from_api(data = nil)
    data ||= api_data
    raise 'Missing Harvest Entry Data' if data.nil?
    update(
      harvest_task_id:    data[:task_id],
      harvest_project_id: data[:project_id],
      notes:              data[:notes],
      hours:              data[:hours],
      harvest_spent_on:   data[:spent_at],
      harvest_created_at: data[:created_at],
      harvest_updated_at: data[:updated_at]
    )
  end

  private

  def api_data
    organization.harvesting.request.reports
                .time_by_project(project.harvest_id,
                                 harvest_spent_on,
                                 Time.now, {})
                .select { |e| e['id'] == harvest_id }.first
  end
end
