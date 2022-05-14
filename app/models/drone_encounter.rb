# frozen_string_literal: true

# Represents the Enounter
class DroneEncounter < ApplicationRecord
  belongs_to :team

  after_create_commit lambda {
    broadcast_update_to 'drone_encounters_tally',
                        partial: 'drone_encounters/dronetally',
                        target: 'dronetally',
                        locals: {
                          drone_encounters: DroneEncounter.all.order(drone_kills: :desc),
                          total_kills: DroneEncounter.all.map(&:drone_kills).sum
                        }
  }

  after_update_commit lambda {
    broadcast_update_to 'drone_encounters_tally',
                        partial: 'drone_encounters/dronetally',
                        target: 'dronetally',
                        locals: {
                          drone_encounters: DroneEncounter.all.order(drone_kills: :desc),
                          total_kills: DroneEncounter.all.map(&:drone_kills).sum
                        }
  }
end
