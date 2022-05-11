# frozen_string_literal: true

# Represents a team
class Team < ApplicationRecord
  has_many :drone_encounters
  has_many :players
end
