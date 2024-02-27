class Player < ApplicationRecord
  belongs_to :team

  validates :name, presence: true
  validates :nickname, presence: true
  validates :nationality, presence: true
  validates :birth_date, presence: true
  validate :minimum_age

  has_many :player_performances

  def minimum_age
    if birth_date.present? && birth_date > 18.years.ago.to_date
      errors.add(:birth_date, "must be at least 18 years old to participate in games")
    end
  end
end
