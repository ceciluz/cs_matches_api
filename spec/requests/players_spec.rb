# frozen_string_literal: true

require 'rails_helper'
require 'swagger_helper'

RSpec.describe 'CS API', type: :request do
  path '/players' do
    get 'Retrieves all players' do
      tags 'Players'
      consumes 'application/json'
      produces 'application/json'
      description 'Retrieve all players'

      response 200, 'OK' do
        before { create_list(:player, 10) }
        run_test!
      end
    end

    post 'Create a player ' do
      tags 'Players'
      consumes 'application/json'
      produces 'application/json'
      parameter name: :player, in: :body, schema: { '$ref' => '#components/schemas/player_params' }
      description 'Creates player'

      response 201, 'Created' do
        let(:player) { build(:player, team: create(:team)) }
        run_test!
      end

      response 422, 'Unprocessable Entity' do
        let(:player) { build(:player, team: nil) }
        run_test!
      end
    end

    path '/players/{id}' do
      get 'Retrieves a player based on his id' do
        tags 'Players'
        consumes 'application/json'
        produces 'application/json'
        parameter name: :id, in: :path, type: :string
        description 'Retrieves a player based on his id'

        response 200, 'OK' do
          let(:id) { 1 }
          before { create(:player, id:) }
          run_test!
        end

        response 404, 'Not Found' do
          let(:id) { 0 }
          run_test!
        end
      end
    end

    path '/players/{id}' do
      patch 'Updates a player information' do
        tags 'Players'
        consumes 'application/json'
        produces 'application/json'
        parameter name: :id, in: :path, type: :string
        parameter name: :player, in: :body, schema: { '$ref' => '#components/schemas/player_params' }
        description 'Updates a player based on his id'

        response 200, 'OK' do
          let(:id) { 1 }
          before { create(:player, id:) }
          let(:player) { { name: 'Jane Doe' } }
          run_test! do |response|
            data = JSON.parse(response.body)
            expect(data['name']).to eq('Jane Doe')
          end
        end

        response 422, 'Unprocessable Entity' do
          let(:id) { 0 }
          before { create(:player, id:) }
          let(:player) { { name: ' ' } }
          run_test!
        end
      end
    end

    path '/players/{id}' do
      delete 'Delete a player information' do
        tags 'Players'
        consumes 'application/json'
        produces 'application/json'
        parameter name: :id, in: :path, type: :string
        description 'Deletes a player information based on his id'

        response 204, 'No Content' do
          let(:id) { 1 }
          before { create(:player, id:) }
          run_test!
        end

        response 404, 'Not Found' do
          let(:id) { 0 }
          run_test!
        end
      end
    end
  end
end
