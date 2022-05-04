# frozen_string_literal: true

# controller for displaying drone encounters
class DroneEncountersController < ApplicationController
  before_action :set_new_encounter, only: %i[index new]
  before_action :set_drone_encounters

  def index; end

  def new; end

  def create
    @drone_encounter = DroneEncounter.new(drone_params)

    if @drone_encounter.save
      turbo_stream.prepend 'encounters', :encounter
    else
      render :new
    end
  end

  def set_drone_encounters
    @drone_encounters = DroneEncounter.all.order('id DESC')

    @total_drones_killed = @drone_encounters.map(&:drone_kills).compact&.sum || 0
  end

  def set_new_encounter
    @new_drone_encounter = DroneEncounter.new

    4.times { @new_drone_encounter.players.new }
  end

  def drone_params
    params.require(:drone_encounter)
          .permit(:drone_kills,
                  :win,
                  players_attributes: %i[player_name hero hero_aspect])
  end
end
