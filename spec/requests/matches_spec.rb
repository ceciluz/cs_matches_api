require 'rails_helper'
require 'swagger_helper'

RSpec.describe "Counter Strike API",  type: :request do


  path '/matches' do
    post 'Creates a match' do
      tags 'Matches'
      consumes 'application/json'
      produces 'application/json'
      # parameter name: :match, in: :body, schema: { '$ref' => '#/components/schemas/match_params' }
      parameter name: :abc, in: :body, schema: {
        type: :object,
        properties: {
          team_home_score: { type: :integer, default: 0, example: 20 },
          team_away_score: { type: :integer, default: 0, example: 25 },
          team_home_id: {  type: :integer, example: 1 },
          team_away_id: {  type: :integer, example: 2 },
          player_performances_attributes: {
            type: :array,
            items: {
              type: :object,
              properties: {
                kills: { type: :integer, default: 0, example: 25 },
                deaths: { type: :integer, default: 0, example: 20 },
                assists: { type: :integer, default: 0, example: 20 },
                headshots: { type: :integer, default: 0, example: 10 },
                player_id: { type: :integer, example: 1 }
              }
            }
          }
        },
       }


      response 201, 'Created' do
        let(:team_home) {create(:team, id: 1) }
        let(:team_away) {create(:team, id: 2) }
        let(:player) {create(:player, id: 1) }
        let(:player_performances) {create_list(:player_performance, 5, player: player) }
        let(:abc) { build(:match, team_home:, team_away:, player_performances:) }
        run_test!
      end
    end
  end
end







# require 'rails_helper'
# require 'swagger_helper'

# RSpec.describe "cs_matches", type: :request do
#   path '/matches' do
#     post 'creates a match' do
#       consumes 'application/json'
#         produces 'application/json'
#       parameter name: :match, in: :body, schema: {
#       type: :object,
#       properties: {
#         team_home_score: { type: :integer, default: 0, example: 20 },
#         team_away_score: { type: :integer, default: 0, example: 25 },
#         team_home_id: {  type: :integer, example: 1 },
#         team_away_id: {  type: :integer, example: 2 },
#         player_performances_attributes: {
#           type: :array,
#           items:
#           {
#             type: :object,
#             properties: {
#               kills: { type: :integer, default: 0, example: 25 },
#               deaths: { type: :integer, default: 0, example: 20 },
#               assists: { type: :integer, default: 0, example: 20 },
#               headshots: { type: :integer, default: 0, example: 10 },
#               player_id: { type: :integer, example: 1 }
#             }
#           }
#         }
#       }
#     }
#       #parameter name: :match, in: :body, schema: { '$ref' => '#/components/schemas/match_params' }
#       response 201, 'Created' do
#         let(:team_home) {create(:team, id: 1) }
#         let(:team_away) {create(:team, id: 2) }
#         let(:player) {create(:player, id: 1) }
#         let(:player_performances) {create_list(:player_performance, 5, player: player) }
#         let(:match) { build(:match, team_home:, team_away:, player_performances:) }

#            run_test!
#       end
#       # response 422, 'create not succeful' do

#       # end
#     end
#   end

#   #   it 'returns 201 when params are valid' do
#   #     post '/matches', params: {
#   #       team_home_id: "3",
#   #       team_away_id: "2",
#   #       team_home_score: "2",
#   #       team_away_score: 10,
#   #       player_performances_attributes: [
#   #         {
#   #           player_id: 12,
#   #           kills: 1,
#   #           deaths: 1,
#   #           assists: 3,
#   #           headshots: 4
#   #         },
#   #         {
#   #           player_id: 11,
#   #           kills: 1,
#   #           deaths: 1,
#   #           assists: 3,
#   #           headshots: 4
#   #         }
#   #       ]
#   #     }
#   #     expect(response.status).to eq(201)
#   #   end
#   # end
# end
