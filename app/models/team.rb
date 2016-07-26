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
      # teams(current_user).map do |team|
      #                 team["data"][0]["value"]
      #               end
      team_ids   = teams(current_user).map do |team|
                      team["data"][0]["value"]
                    end
      team_ids.zip(team_names).map {|pair| Hash[*pair]}
      # [["Team Teamtastic", 1931903], ["CU Buffs", 1974307]]
  end

  def self.combine_member_data(current_user)
    teams_list(current_user).keys.each do |key|
      teams_list[key] = 
    end
  end
  # def self.team_ids(current_user)
  #   teams_list(current_user).values
  # end
  #
  # def self.team_names(current_user)
  #   teams_list(current_user).keys
  # end
  # def self.team_members(current_user, team_ids_list)
  #   team_ids_list(current_user).each do |id|
  #     service.get_team_members(current_user, id)
  #   end
  #
  #   # team_members_array = service.get_team_members(current_user, team_id)
  #   # team_members_array.map { |team_member| Member.new(team_member)}
  # end

  def self.members(current_user, team_id)
    service.get_team_members(current_user, team_id)
  end

  # def self.roster_hashes(current_user, list)
  #   list.map {|team| list[1] = team_members(current_user, team[1])}
  # end

end
