class Staff < ApplicationRecord
  has_many :entries, dependent: :destroy
  has_many :projects, through: :entries
  belongs_to :organization

  after_create :update_data_from_api

  def self.find_or_create_with(harvest_id: nil, org: nil)
    raise 'Missing Harvest User Data' if harvest_id.nil? || org.nil?
    find_or_create_by(harvest_id: harvest_id, organization: org)
  end

  def update_data_from_api(data = nil)
    data ||= organization.harvesting.request
                         .users.find(harvest_id)
    raise 'Missing Harvest User Data' if data.nil?
    update(
      first_name:         data[:first_name],
      last_name:          data[:last_name],
      email:              data[:email],
      harvest_created_at: data[:created_at],
      harvest_updated_at: data[:updated_at]
    )
  end
end
