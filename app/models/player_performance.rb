class PlayerPerformance < ApplicationRecord
  validates :kills, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :assists, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :deaths, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :headshots, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  belongs_to :player
  belongs_to :match
end
