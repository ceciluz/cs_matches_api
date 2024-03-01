# frozen_string_literal: true

class PlayerPerformance < ApplicationRecord
  after_initialize :set_default_values, if: :new_record?

  belongs_to :player
  belongs_to :match

  validates :kills, :assists, :deaths, :headshots, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  private

  def set_default_values
    self.kills ||= 0
    self.assists ||= 0
    self.deaths ||= 0
    self.headshots ||= 0
  end


end
