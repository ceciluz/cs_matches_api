require 'rails_helper'

RSpec.describe "Matches", type: :request do
  describe 'POST /matches' do
    it 'returns 201 when params are valid' do
      post '/matches', params: {
        team_home_id: "3",
        team_away_id: "2",
        team_home_score: "2",
        team_away_score: 10,
        player_performances_attributes: [
          {
            player_id: 12,
            kills: 1,
            deaths: 1,
            assists: 3,
            headshots: 4
          },
          {
            player_id: 11,
            kills: 1,
            deaths: 1,
            assists: 3,
            headshots: 4
          }
        ]
      }
      expect(response.status).to eq(201)
    end
  end
end
