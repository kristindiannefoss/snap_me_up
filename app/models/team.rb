class Team < OpenStruct
  def self.service
    @service ||= TeamSnapService.new
  end

  def self.teams(current_user)
    teams_array = service.get_teams(current_user)
    teams_array.map { |team| Team.new(team)}
  end

  def self.teams_list(current_user)
      team_names = teams(current_user).map do |team|
                      team["data"][14]["value"]
                    end
      team_ids   = teams(current_user).map do |team|
                      team["data"][0]["value"]
                    end
      team_names.zip(team_ids)
  end

  def self.team_members(current_user, team_id)
    team_members_array = service.get_team_members(current_user, team_id)
    team_members_array.map { |team_member| Member.new(team_member)}
  end

  def self.roster_hashes(current_user, list)
    list.map {|team| list[1] = team_members(current_user, team[1])}
  end

end
