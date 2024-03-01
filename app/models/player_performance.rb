# frozen_string_literal: true

class PlayerPerformance < ApplicationRecord
  belongs_to :player
  belongs_to :match

  validates :kills, :assists, :deaths, :headshots, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

end
