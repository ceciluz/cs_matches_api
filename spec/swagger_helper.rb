# frozen_string_literal: true

require 'rails_helper'

RSpec.configure do |config|
  # Specify a root folder where Swagger JSON files are generated
  # NOTE: If you're using the rswag-api to serve API descriptions, you'll need
  # to ensure that it's configured to serve Swagger from the same folder
  config.openapi_root = Rails.root.join('swagger').to_s

  # Define one or more Swagger documents and provide global metadata for each one
  # When you run the 'rswag:specs:swaggerize' rake task, the complete Swagger will
  # be generated at the provided relative path under openapi_root
  # By default, the operations defined in spec files are added to the first
  # document below. You can override this behavior by adding a openapi_spec tag to the
  # the root example_group in your specs, e.g. describe '...', openapi_spec: 'v2/swagger.json'
  config.openapi_specs = {
    'v1/swagger.yaml' => {
      openapi: '3.0.1',
      info: {
        title: 'API V1',
        version: 'v1'
      },
      paths: {},
      servers: [
        {
          url: 'https://{defaultHost}',
          variables: {
            defaultHost: {
              default: 'www.example.com'
            }
          }
        }
      ],
      components: {
        schemas: {
          match: {
            type: :object,
            properties: {
              team_home_score: { type: :integer, default: 0, example: 20, description: 'test' },
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
            }
          },
          player_params: {
            type: :object,
            properties: {
              name: { type: :string, example: 'Name' },
              nickname: { type: :string, example: 'Nickname' },
              nationality: { type: :string, example: 'Nationality' },
              birth_date: { type: :string, format: 'date', example: '2001-01-01' },
              team_id: { type: :integer, example: 1 }
            }
          },

          player_response: {
            type: :object,
            properties: {
              id: { type: :integer, example: 1 },
              name: { type: :string, example: 'Player Name' },
              nickname: { type: :string, example: 'Player Nickname' },
              nationality: { type: :string, example: 'Brazilian' },
              birth_date: { type: :string, format: 'date', example: '2006-01-01' },
              age: { type: :integer, example: 18 },
              team: {
                type: :object,
                properties: {
                  id: { type: :integer, example: 1 },
                  name: { type: :string, example: 'Team Name' },
                  country: { type: :string, example: 'Brasil' },
                  region: { type: :string, example: 'South America' }
                }
              }
            }
          },

          team_params: {
            type: :object,
            properties: {
              name: { type: :string, example: 'Name' },
              country: { type: :string, example: 'Country' },
              region: { type: :string, example: 'Continent' }
            }
          },

          team_response: {
            type: :object,
            properties: {
              id: { type: :integer, example: 1 },
              name: { type: :string, example: ' Name' },
              country: { type: :string, example: 'Country' },
              region: { type: :string, example: 'Continent' },
              players: {
                type: :array, items: {
                  type: :object, properties: {
                    id: { type: :integer, example: 1 },
                    name: { type: :string, example: ' Name' },
                    nickname: { type: :string, example: ' Nickname' },
                    nationality: { type: :string, example: 'Nationality' },
                    birth_date: { type: :string, format: 'date', example: '2001-01-01' },
                    age: { type: :integer, example: 18 }
                  }
                }
              }
            }
          }
        }
      }
    }
  }

  # Specify the format of the output Swagger file when running 'rswag:specs:swaggerize'.
  # The openapi_specs configuration option has the filename including format in
  # the key, this may want to be changed to avoid putting yaml in json files.
  # Defaults to json. Accepts ':json' and ':yaml'.
  config.openapi_format = :yaml
end
