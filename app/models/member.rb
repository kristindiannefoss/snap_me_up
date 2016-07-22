class Member < OpenStruct
  def self.service
    @service ||= TeamSnapService.new
  end

  def self.team_members(team_id)
    team_members_array = service.get_team_members(current_user, team_id)
    team_members_array.map { |team_member| Member.new(team_member)}
  end
end
