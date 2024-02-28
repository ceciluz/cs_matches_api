# require 'rails_helper'

# RSpec.describe "Matches", type: :request do
#   describe 'POST #create' do
#     context 'with valid parameters' do
#       let(:valid_params) { FactoryBot.attributes_for(:match) }

#       it 'creates a new match' do
#         expect {
#           post matches_path(params: { match: valid_params })
#         }.to change(Match, :count).by(1)
#       end

#       it 'returns a successful response' do
#         post matches_path(params:{ match: valid_params })
#         expect(response).to have_http_status(:created)
#       end
#     end
#   end
# end

# spec/requests/matches_spec.rb

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
              required: %w[player_id kills assists deaths headshots]
            }
          }
        },
        required: %w[team_home_score team_away_score team_home_id team_away_id
                     player_performances_attributes]
      }

      response '201', 'match created' do
        let(:match) do
          { team_home_score: 2, team_away_score: 1, team_home_id: 1, team_away_id: 2,
            player_performances_attributes:
        [{ player_id: 1, kills: 5, assists: 2, deaths: 1, headshots: 3 }] }
        end
        run_test!
        post '/matches', params: { match: }, as: :json
      end
      response '422', 'invalid request' do
        let(:match) { { team_home_score: 'invalid' } }
        run_test!
      end
    end
  end
end
