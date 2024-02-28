# frozen_string_literal: true

class PlayerPerformance < ApplicationRecord

  after_initialize :set_default_values, if: :new_record?

  validates :kills, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :assists, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :deaths, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :headshots, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  belongs_to :player
  belongs_to :match

  private

  def set_default_values
    self.kills ||= 0
    self.assists ||= 0
    self.deaths ||= 0
    self.headshots ||= 0
  end
end
