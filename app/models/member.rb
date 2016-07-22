class Member < OpenStruct
  # def self.service
  #   @service ||= TeamSnapService.new
  # end
  #
  # def self.team_members(team_id)
  #   team_members_array = service.get_team_members(current_user, team_id)
  #   team_members_array.map { |team_member| Member.new(team_member)}
  # end

  # private
  #
  #   def get_teams(current_user)
  #     Team.teams_list(current_user)
  #   end
  #
  #   Member.team_members(@team)
end
