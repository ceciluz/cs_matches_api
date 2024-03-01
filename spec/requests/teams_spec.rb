require 'rails_helper'
require 'swagger_helper'

RSpec.describe "CS API", type: :request do
  let(:id) { 1 }

  path '/teams' do
    get 'Shows all teams' do
      tags 'Teams'
      consumes 'application/json'
      produces 'applcation/json'
      description 'Shows all teams in database'

      response 200, 'OK' do
        before {create_list(:team, 10)}
        run_test!
      end
    end

    post 'Create teams' do
      tags 'Teams'
      consumes 'application/json'
      produces 'applcation/json'
      parameter name: :team, in: :body, schema:{'$ref' => '#/components/schemas/team_params'}
      description 'Create a new team in database'

      response 201, 'Create' do
        let(:team) {build(:team, id:)}
        run_test!
      end

      response 422, 'Unprocessable Entity' do
        before {create(:team)}
        let(:team){{name: ' '}}
        run_test!
      end
    end
  end

  path '/teams/{id}' do
    get 'Shows team' do
      tags 'Teams'
      consumes 'application/json'
      produces 'applcation/json'
      parameter name: :id, in: :path, type: :string
      description 'Shows team based on id'

      response 200, 'OK' do
        before { create(:team, id:) }
        run_test!
      end

      response 404, 'Not Found' do
        run_test!
      end
    end

    patch 'Update a team' do
      tags 'Teams'
      tags 'Teams'
      consumes 'application/json'
      produces 'applcation/json'
      parameter name: :id, in: :path, type: :string
      parameter name: :team, in: :body, schema:{'$ref' => '#/components/schemas/team_params'}
      description 'Update a new team in database'

      response 200, 'OK' do
        let(:id) { 1 }
        before { create(:team, id:id) }
        let(:team) {{name: 'Team'}}
        run_test! do |response|
          data= JSON.parse(response.body)
          expect(data['name']).to eq('Team')
        end
      end

      response 404, 'Not Found' do
        let(:team) {{name: 'Team'}}
        run_test!
      end

      response 422, 'Unprocessable Entity' do
          before { create(:team, id:) }
          let(:team) { { name: ' ' } }
          run_test!
      end

    end

    delete 'Deletes a team' do
      tags 'Teams'
      consumes 'application/json'
      produces 'applcation/json'
      parameter name: :id, in: :path, type: :string
      description 'Deletes a team based on its id'


      response 204, 'No Content' do
        let(:id) { 1 }
        before { create(:team, id: id) }
        run_test!
      end

      response 404, 'Not Found' do
        let(:id) { 0 }
        run_test!
      end
    end
  end
end
