# frozen_string_literal: true

# Represents a team
class Team < ApplicationRecord
  has_many :drone_encounters
  has_many :players
  accepts_nested_attributes_for :players, reject_if: proc { |att| att['hero_id'].blank? }
end
