
require 'swagger_helper'

describe 'Matches API' do
  path '/matches' do
    post 'Creates a match' do
      tags 'Matches'
      consumes 'application/json'
      parameter name: :match, in: :body, schema: {
        type: :object,
        properties: {
          team_home_score: { type: :integer },
          team_away_score: { type: :integer },
          team_home_id: { type: :integer },
          team_away_id: { type: :integer },
          player_performances_attributes: {
            type: :array,
            items: {
              type: :object,
              properties: {
                player_id: { type: :integer },
                kills: { type: :integer },
                assists: { type: :integer },
                deaths: { type: :integer },
                headshots: { type: :integer }
              },
              required: [ 'player_id', 'kills', 'assists', 'deaths', 'headshots' ]
            }
          }
        },
        required: [ 'team_home_score', 'team_away_score', 'team_home_id', 'team_away_id', 'player_performances_attributes' ]
      }

      response '201', 'match created' do
        let(:match) { { team_home_score: 2, team_away_score: 1, team_home_id: 1, team_away_id: 2,
        player_performances_attributes:
        [{ player_id: 1, kills: 5, assists: 2, deaths: 1, headshots: 3 }] } }
        run_test!
        post '/matches', params: { match: match }, as: :json
      end
      response '422', 'invalid request' do
        let(:match) { { team_home_score: 'invalid' } }
        run_test!
      end
    end
  end
end
