# frozen_string_literal: true
MINIMUM_AGE = 18
class Player < ApplicationRecord
  belongs_to :team
  validates :name, :nickname, :nationality, :birth_date, presence: true
  validate :minimum_age

  has_many :performances, class_name: 'PlayerPerformance', dependent: :destroy

  def minimum_age
    return unless birth_date.present? && birth_date > MINIMUM_AGE.years.ago.to_date

    errors.add(:birth_date, 'must be at least 18 years old to participate in games')
  end

  def age
    now = Time.now.utc.to_date
    now.year - birth_date.year - (now.month > birth_date.month || (now.month == birth_date.month && now.day >= birth_date.day) ? 0 : 1)
  end
end
