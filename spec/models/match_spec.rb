# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Match, type: :model do
  subject(:match) { build(:match) }

  describe 'Associations' do
    it { is_expected.to have_many(:players_performances) }
    it { is_expected.to belong_to(:home_team) }
    it { is_expected.to belong_to(:away_team) }
  end

  describe 'Validations' do
    it { is_expected.to validate_presence_of(:team_home_score).with_message("can't be blank") }
    it { is_expected.to validate_presence_of(:team_away_score).with_message("can't be blank") }
    it { is_expected.to validate_comparison_of(:team_home_score).is_greater_than_or_equal_to(0) }
    it { is_expected.to validate_comparison_of(:team_away_score).is_greater_than_or_equal_to(0) }
  end
end
