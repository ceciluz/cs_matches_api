require 'rails_helper'

RSpec.describe Player, type: :model do
  subject(:player){build(:player)}

  describe 'Associations' do
    it {is_expected.to have_many(:player_performances)}
    it { is_expected.to belong_to(:team) }
  end

  describe 'Validations' do
    it { is_expected.to validate_presence_of(:name).with_message("can't be blank") }
    it { is_expected.to validate_presence_of(:nickname).with_message("can't be blank") }
    it { is_expected.to validate_comparison_of(:nationality).with_message("can't be blank") }
    it { is_expected.to validate_comparison_of(:birth_date).with_message("can't be blank") }
    it { is_expected.to validate_comparison_of(:minimum_age).is_greater_than_or_equal_to(18)}
  end
end
