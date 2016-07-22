class Team < OpenStruct
  def self.service
    @service ||= TeamSnapService.new
  end

  def self.teams
    teams_array = service.get_teams(current_user)
    teams_array.map { |team| Team.new(team)}
  end
end
