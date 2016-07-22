class Team < OpenStruct
  attr_reader :team_id,
              :team_name,
              :team_members

  def self.service
    @service ||= TeamSnapService.new
  end

  def service.teams
    service.teams.map { |team| Team.new(team)}
  end

  def self.find(team_id)
    Team.new(service.team_members(current_user, team_id))
  end

  def initialize(data)
    @team_id   = data["collection"]["items"][0]["data"][0]["value"]
    @team_name = data["collection"]["items"][0]["data"][14]["value"]
  end

end
