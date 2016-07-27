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
      # teams(current_user).map do |team|
      #                 team["data"][0]["value"]
      #               end
      team_ids   = teams(current_user).map do |team|
                      team["data"][0]["value"]
                    end
      team_ids.zip(team_names) #.map {|pair| Hash[*pair]}
      # [["Team Teamtastic", 1931903], ["CU Buffs", 1974307]]
  end

  def self.team_names(current_user)
    all(current_user).map {|team| team[1]}
  end

  # def self.find_by_id(current_user, team_id)
  #   all(current_user).keep_if {|team| team_id.to_i == team[0]}[0][0]
  # end

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
  # def self.members(current_user, team_id)
  #   service.get_team_members(current_user, team_id)
  # end
  #
  # def self.members(current_user, team_id)
  #   # parsed = get_team_members(current_user, team_id)
  #   get_team_members(current_user, team_id)
  #   # team_members = []
  #   # parsed.items.each do |member|
  #   #   team_member = {}
  #   #   member.data.each do |item|
  #   #     member[item.name] = item.value
  #   #   end
  #   #   team_members << team_member
  #   # end
  #   # team_members
  # end

  # def self.combine_member_data(current_user)
  #   teams_list(current_user).keys.each do |key|
  #     teams_list[key] =
  #   end
  # end
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



  # def self.roster_hashes(current_user, list)
  #   list.map {|team| list[1] = team_members(current_user, team[1])}
  # end

end
