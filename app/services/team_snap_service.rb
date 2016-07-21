class TeamSnapService
  attr_reader :conn

  def initialize
    @conn = Faraday.new(url: 'https://api.teamsnap.com/v3/')
  end
{"active_teams"=>"https://api.teamsnap.com/v3/teams/active?user_id=8386847", "apn_devices"=>"https://api.teamsnap.com/v3/apn_devices/search?user_id=8386847", "contacts"=>"https://api.teamsnap.com/v3/contacts/search?user_id=8386847", "division_members"=>"https://api.teamsnap.com/v3/division_members/search?user_id=8386847", "facebook_pages"=>"https://api.teamsnap.com/v3/facebook_pages/search", "gcm_devices"=>"https://api.teamsnap.com/v3/gcm_devices/search?user_id=8386847", "members"=>"https://api.teamsnap.com/v3/members/search?user_id=8386847", "message_data"=>"https://api.teamsnap.com/v3/message_data/search?user_id=8386847", "messages"=>"https://api.teamsnap.com/v3/messages/search?user_id=8386847", "personas"=>"https://api.teamsnap.com/v3/members/personas?user_id=8386847", "teams"=>"https://api.teamsnap.com/v3/teams/search?user_id=8386847", "teams_preferences"=>"https://api.teamsnap.com/v3/teams_preferences/search?user_id=8386847", "tsl_metadatum"=>"https://api.teamsnap.com/v3/tsl_metadata/search?user_id=8386847"}



"teams"=>"https://api.teamsnap.com/v3/teams/search?user_id=8386847"
  def team_info(current_user, auth_token)
    request = conn.get "teams/search?user_id=#{current_user.fetch("id")}", {:Authorization => "Bearer #{auth_token}"}


  def stores(zip)
    request = conn.get "stores(area(#{zip},25))", {
      apiKey: ENV["best_buy_secret_key"],
      format: "json",
      pageSize: 17
    }
    JSON.parse(request.body)
  end

    def self.get_team_info(current_user, auth_token)
      RestClient.get %Q(https://api.teamsnap.com/v3/teams/search?user_id=#{current_user.fetch("id")}), {:Authorization => "Bearer #{auth_token}"}
    end

    def self.create_team_item(parsed_team_info)
      team = {}
      parsed_team_info.items.first.data.each do |item|
        team[item.name] = item.value
      end
      team
    end

    def self.get_team_members(team_id, auth_token)
      RestClient.get %Q(https://api.teamsnap.com/v3/members/search?team_id=#{team_id}), {:Authorization => "Bearer #{auth_token}"}
    end


end
