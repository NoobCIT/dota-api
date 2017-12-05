module Dota

  class Data

    def initialize(account_id)
      @account_id = account_id
    end

    def matches
      response = HTTParty.get("https://api.opendota.com/api/players/#{@account_id}/matches")
      JSON.parse response.body
    end

    def record
      response = HTTParty.get("https://api.opendota.com/api/players/#{@account_id}/wl")
      JSON.parse response.body
    end

    def mmr
      response = HTTParty.get("https://api.opendota.com/api/players/#{@account_id}")
      JSON.parse response.body
    end

    def heroes
      response = HTTParty.get("https://api.opendota.com/api/players/#{@account_id}/heroes")
      JSON.parse response.body
    end

    def name
      response = HTTParty.get("https://api.opendota.com/api/players/#{@account_id}")
      JSON.parse response.body
    end
  end
end
