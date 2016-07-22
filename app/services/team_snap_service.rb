class TeamSnapService
  attr_reader :conn

  def initialize
    @conn = Faraday.new(url: 'https://api.teamsnap.com/v3/')
  end

  def get_teams(current_user)
    response = conn.get do |req|
                req.url "teams/search?user_id=#{current_user.uid}"
                req.headers['Authorization'] = "Bearer #{current_user.token}"
              end
    parsed = parse(response)
    parsed["collection"]["items"]
  end

  def get_team_members(current_user, team_id)
    member_response = conn.get do |req|
                req.url "members/search?team_id=#{team_id}"
                req.headers['Authorization'] = "Bearer #{current_user.token}"
              end
    parsed_member_info = parse(member_response)
    parsed_member_info["collection"]["items"]
  end

  private

    def parse(response)
      JSON.parse(response.body)
    end

end
