class ClientSideRoutes
  ORGANIZATIONS = '/organizations'
  PROJECTS = '/projects'
  TASKS = '/tasks'

  class << self
    def organization(id)
      "#{ORGANIZATIONS}/#{id}"
    end

    def project(id)
      "#{PROJECTS}/#{id}"
    end
  end

  PROJECT = project(':id')
  ORGANIZATION = organization(':id')
end