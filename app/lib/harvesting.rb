# app/lib/harvesting.rb
#
## Quick Reference:
# Projects:
#   request.projects.all
#   request.projects.find(1234567)
# Users:
#   request.users.all
#   request.users.find(87654321)
# Tasks:
#   request.tasks.all
#   request.tasks.find(54321)
# Time Entries:
#   request.time.all
#   request.time.find(6754321)
#   request.reports.time_by_project(1234567, 5.days.ago, Time.now, {})

class Harvesting
  def initialize(*args)
    options = args.extract_options!
    begin
      @harvesting = Harvest.hardy_client(subdomain:  options[:subdomain],
                                         username:   options[:username],
                                         password:   options[:password])
    rescue LoadError => e
      raise e
    end
  end

  def request
    @harvesting
  end
end
