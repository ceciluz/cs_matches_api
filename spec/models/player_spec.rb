# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Player, type: :model do

  describe 'Associations' do
    it { is_expected.to have_many(:player_performances) }
    it { is_expected.to belong_to(:team) }
  end

  describe 'Validations' do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:nickname) }
    it { is_expected.to validate_presence_of(:nationality) }
    it { is_expected.to validate_presence_of(:birth_date) }

    context 'when validating age' do

    let(:valid_player) { build(:player, birth_date: Date.today - 19.years) }
    let(:invalid_player) { build(:player, birth_date: Date.today - 10.years) }

      it 'is valid when player is over 18 years old' do
        expect(valid_player).to be_valid
      end
      it 'is not valid when player is less than 18 years old' do
        expect(invalid_player).not_to be_valid
      end
    end
  end
end
