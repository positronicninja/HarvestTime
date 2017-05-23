class Organization < ApplicationRecord
  has_many :projects
  has_many :staff

  def harvesting
    @harvesting ||= connect_to_api
  end

  private

  def connect_to_api
    raise 'Missing Credentials' if full_domain.blank? || harvest_id.blank? || harvest_key.blank?
    @harvesting ||= Harvesting.new(subdomain:  full_domain,
                                   username:   ENV[harvest_id],
                                   password:   ENV[harvest_key])
  end
end
