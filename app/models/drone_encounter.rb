# frozen_string_literal: true

# Represents the Enounter
class DroneEncounter < ApplicationRecord
  has_many :players
  accepts_nested_attributes_for :players, reject_if: proc { |att| att['hero'].blank? }
end
