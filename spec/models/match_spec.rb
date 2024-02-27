require 'rails_helper'

RSpec.describe Match, type: :model do
  subject(:match){build(:match)}

  describe 'Associations' do
    it {is_expected.to have_many(:player_performances)}
    it {is_expected.to have_one(:team_away_id)}
    it {is_expected.to have_one(:team_home_id)}
  end

  describe 'Validations' do
    it { is_expected.to validate_presence_of(:team_home_score).with_message("can't be blank") }
    it { is_expected.to validate_presence_of(:team_away_score).with_message("can't be blank") }
    it { is_expected.to validate_comparison_of(:team_home_score).is_greater_than_or_equal_to(0)}
    it { is_expected.to validate_comparison_of(:team_away_score).is_greater_than_or_equal_to(0)}
  end

end
