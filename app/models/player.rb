# frozen_string_literal: true


# Represents a player
class Player < ApplicationRecord
  belongs_to :team
end
