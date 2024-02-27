require 'rails_helper'

RSpec.describe PlayerPerformance, type: :model do
  describe 'Associations' do
    it { is_expected.to belong_to(:player) }
    it { is_expected.to belong_to(:match) }
  end

  describe 'Validations' do
    it { is_expected.to validate_presence_of(:kills).with_message("can't be blank") }
    it { is_expected.to validate_presence_of(:assists).with_message("can't be blank") }
    it { is_expected.to validate_presence_of(:deaths).with_message("can't be blank") }
    it { is_expected.to validate_presence_of(:headshots).with_message("can't be blank") }

    it { is_expected.to validate_comparison_of(:kills).is_greater_than_or_equal_to(0)}
    it { is_expected.to validate_comparison_of(:assists).is_greater_than_or_equal_to(0)}
    it { is_expected.to validate_comparison_of(:deaths).is_greater_than_or_equal_to(0)}
    it { is_expected.to validate_comparison_of(:headshots).is_greater_than_or_equal_to(0)}

  end
end
