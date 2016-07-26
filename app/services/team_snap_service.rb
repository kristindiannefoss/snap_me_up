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
    collection = parsed_member_info["collection"]["items"]
    member_array = collection.map do |member|
          id = member["data"][0]["value"]
          first_name = member["data"][8]["value"]
          last_name = member["data"][30]["value"]
          { id: id, first_name: first_name, last_name: last_name }
    end
    member_array
  end

# {:id => member[i]["data"][0]["value"], :first_name => member[i]["data"][8]["value"], :last_name => member[i]["data"][30]["value"]}

  private

    def parse(response)
      JSON.parse(response.body)
    end

end
