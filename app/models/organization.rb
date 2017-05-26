class Organization < ApplicationRecord
  has_many :projects
  has_many :clients
  has_many :staff
  has_many :collaborations, through: :projects

  def harvesting
    @harvesting ||= connect_to_api
  end

  def update_via_api
    account = harvesting.request.account.who_am_i
    update(name:      account.company.name,
           base_uri:  account.company.base_uri,
           active:    account.company.active)
  end

  def update_projects_from_api(force_update: false)
    harvesting.request.projects.all.each do |proj_data|
      break unless force_update || proj_data['active']
      Project.update_data_for_project(data: proj_data, org: self)
    end
  end

  private

  def connect_to_api
    raise 'Missing Credentials' if full_domain.blank? || harvest_id.blank? || harvest_key.blank?
    @harvesting ||= Harvesting.new(subdomain:  full_domain,
                                   username:   ENV[harvest_id],
                                   password:   ENV[harvest_key])
  end
end
