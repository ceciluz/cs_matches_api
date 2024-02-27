require 'rails_helper'

RSpec.describe Team, type: :model do
  subject(:team){build(:team)}

  describe 'Associations' do
    it {is_expected.to have_many(:players)}
    it {is_expected.to have_many(:matches_as_home_team)}
    it {is_expected.to have_many(:matches_as_away_team)}
  end

  describe 'Validations' do
    it { is_expected.to validate_presence_of(:name).with_message("can't be blank") }
    it { is_expected.to validate_presence_of(:country).with_message("can't be blank") }
    it { is_expected.to validate_presence_of(:region).with_message("can't be blank") }
  end

end
