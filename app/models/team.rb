# frozen_string_literal: true

class Team < ApplicationRecord
  validates :name, :country, :region, presence: true

  has_many :players, dependent: :destroy
  has_many :matches_as_home_team, class_name: 'Match', foreign_key: 'team_home_id', dependent: :destroy
  has_many :matches_as_away_team, class_name: 'Match', foreign_key: 'team_away_id', dependent: :destroy
end
