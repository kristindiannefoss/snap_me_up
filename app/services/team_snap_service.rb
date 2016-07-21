class TeamSnapService
  attr_reader :conn

  def initialize
    @conn = Faraday.new(url: 'https://api.teamsnap.com/v3/')
  end
#

  def team_info(current_user, auth_token)
    request = conn.get "teams/search?user_id=#{current_user.uid}", {
      Authorization: "Bearer #{current_user.token}"
    }
  end
end
