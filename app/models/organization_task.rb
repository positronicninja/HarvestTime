class OrganizationTask < ApplicationRecord
  has_many :entries, dependent: :destroy
  belongs_to :task
  belongs_to :organization

  after_create :update_data_from_api

  def self.find_or_create_with(harvest_id: nil, org: nil)
    raise 'Missing Harvest Task Data' if harvest_id.nil? || org.nil?
    new_task = find_or_create_by(harvest_id: harvest_id,
                                 organization: org) do |task|
      data = org.harvesting.request.tasks.find(harvest_id)
      task.task = Task.find_or_create_by(name: data[:name])
    end
    raise 'Unable to save Task' unless new_task.persisted?
    new_task
  end

  def update_data_from_api(data = nil)
    data ||= organization.harvesting.request
                         .tasks.find(harvest_id)
    raise 'Missing Harvest User Data' if data.nil?
    update(name:               data[:name],
           harvest_created_at: data[:created_at],
           harvest_updated_at: data[:updated_at])
  end
end
