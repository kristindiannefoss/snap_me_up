class TeamSnapService
  attr_reader :conn

  def initialize
    @conn = Faraday.new(url: 'https://api.teamsnap.com/v3/')
  end

  def get_team_info(current_user)
    response = conn.get do |req|
                req.url "teams/search?user_id=#{current_user.uid}"
                req.headers['Authorization'] = "Bearer #{current_user.token}"
              end
    parse(response)
  end

  private

    def parse(response)
      JSON.parse(response.body)
    end

end
