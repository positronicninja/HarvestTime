class Client < ApplicationRecord
  belongs_to :organization
  has_many :projects, dependent: :destroy
  has_many :entries,  dependent: :destroy, through: :projects

  after_create :update_data_from_api

  def self.find_or_create_with(harvest_id: nil, org: nil)
    raise 'Missing Harvest Client Data' if harvest_id.nil? || org.nil?
    find_or_create_by(harvest_id: harvest_id, organization: org)
  end

  def update_data_from_api(data = nil)
    data ||= organization.harvesting.request
                         .clients.find(harvest_id)
    raise 'Missing Harvest Client Data' if data.nil?
    update(
      name:               data[:name],
      harvest_created_at: data[:created_at],
      harvest_updated_at: data[:updated_at]
    )
  end
end
