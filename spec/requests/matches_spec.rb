require 'rails_helper'

RSpec.describe "Matches", type: :request do
  describe 'POST #create' do
    context 'with valid parameters' do
      let(:valid_params) { FactoryBot.attributes_for(:match) }

      it 'creates a new match' do
        expect {
          post matches_path(params: { match: valid_params })
        }.to change(Match, :count).by(1)
      end

      it 'returns a successful response' do
        post matches_path(params:{ match: valid_params })
        expect(response).to have_http_status(:created)
      end
    end
  end
end
