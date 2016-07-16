class TeamSnapService

  attr_reader :conn

  def initialize
    @conn = Faraday.new(url: 'https://api.teamsnap.com/v3/')
  end

# https://auth.teamsnap.com

  # def stores(zip)
  #   request = conn.get "stores(area(#{zip},25))", {
  #     apiKey: ENV["best_buy_secret_key"],
  #     format: "json",
  #     pageSize: 17
  #   }
  #   JSON.parse(request.body)
  # end

  # def store(storeId)
  #   request = conn.get "stores(storeId=#{storeId})", {
  #     apiKey: ENV["best_buy_secret_key"],
  #     format: "json",
  #     show: "hoursAmPm"
  #   }
  #   JSON.parse(request.body)
  # end
  #
  # def products(query)
  #   request = conn.get "products(search=#{query})", {
  #     apiKey: ENV["best_buy_secret_key"],
  #     format: "json"
  #   }
  #   JSON.parse(request.body)
  # end

end
