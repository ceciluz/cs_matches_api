require 'rails_helper'
require 'swagger_helper'

RSpec.describe "Counter Strike API",  type: :request do


  path '/matches' do
    post 'Creates a match' do
      tags 'Matches'
      consumes 'application/json'
      produces 'application/json'
      description 'test'
      parameter name: :match, in: :body, schema: { '$ref' => '#/components/schemas/match' }

      response 201, 'Created' do
        let(:team_home) {create(:team, id: 1) }
        let(:team_away) {create(:team, id: 2) }
        let(:player) {create(:player, id: 1) }
        let(:player_performances) {create_list(:player_performance, 5, player: player) }
        let(:match) { build(:match, team_home:, team_away:, player_performances:) }
        run_test!
      end
      response '422', 'Unprocessable Entity' do
        let(:team_home) { create(:team, id: 1) }
        let(:team_away) { create(:team, id: 2) }
        let(:player) { create(:player, id: 1) }
        let(:player_performances) { create_list(:player_performance, 5, player: player) }
        let(:invalid_match) { { team_home_id: nil, team_away_id: nil, team_home_score: nil, team_away_score: nil, player_performances_attributes: [] } }
        let(:match) { invalid_match }
        run_test!
      end
    end
  end
end