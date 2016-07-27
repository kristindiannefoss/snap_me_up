class Team < OpenStruct
  def self.service
    @service ||= TeamSnapService.new
  end

  def self.teams(current_user)
    teams_array = service.get_teams(current_user)
    teams_array.map { |team| Team.new(team)}
  end

  def self.all(current_user)
      team_names = teams(current_user).map do |team|
                      team["data"][14]["value"]
                    end
      team_ids   = teams(current_user).map do |team|
                      team["data"][0]["value"]
                    end
      team_ids.zip(team_names)
  end

  def self.team_names(current_user)
    all(current_user).map {|team| team[1]}
  end

  def self.find_name(current_user, team_id)
    all(current_user).keep_if {|team| team_id.to_i == team[0]}[0][1]
  end

  def self.members(current_user, team_id)
    parsed_member_data = service.get_team_members(current_user, team_id)
          collection = parsed_member_data["collection"]["items"]
          member_array = collection.map do |member|
                id = member["data"][0]["value"]
                first_name = member["data"][8]["value"]
                last_name = member["data"][30]["value"]
                { id: id, first_name: first_name, last_name: last_name }
              end
  end
end
