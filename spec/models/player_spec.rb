# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Player, type: :model do
  subject(:player) { build(:player) }

  describe 'Associations' do
    it { is_expected.to have_many(:performances) }
    it { is_expected.to belong_to(:team) }
  end

  describe 'Validations' do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:nickname) }
    it { is_expected.to validate_presence_of(:nationality) }
    it { is_expected.to validate_presence_of(:birth_date) }

    context 'when player is over 18 years old' do
      it 'is valid' do
        player = build(:player, birth_date: Date.today - 19.years)
        expect(player).to be_valid
      end
    end

    context 'when player is less than 18 years old' do
      it 'is not valid' do
        player = build(:player, birth_date: Date.today - 10.years)
        expect(player).not_to be_valid
      end
    end
  end
end
