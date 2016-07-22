class Team < OpenStruct
  def self.service
    @service ||= TeamSnapService.new
  end

  def self.teams(current_user)
    teams_array = service.get_teams(current_user)
    teams_array.map { |team| Team.new(team)}
  end

  def self.teams_list(current_user)
    teams(current_user).map do |team|
      team["data"][14]["value"]
    end
  end
end
