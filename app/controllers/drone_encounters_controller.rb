# frozen_string_literal: true

# controller for displaying drone encounters
class DroneEncountersController < ApplicationController
  before_action :set_drone_encounters
  before_action :set_team_session
  before_action :set_team
  before_action :set_encounter, only: %i[index new]
  before_action :set_drone_count, only: %i[index new]
  before_action :set_round_count, only: %i[index new]

  def index; end

  def new; end

  def update
    @drone_encounter = DroneEncounter.find_by(identifier: session[:encounter_identifier])

    @drone_encounter.round_number += 1

    @drone_encounter.update(drone_encounter_params)

    render :new
  end

  def create
    @drone_encounter = DroneEncounter.find_by(identifier: session[:encounter_identifier])

    if @drone_encounter
      @drone_encounter.round_number += 1

      @drone_encounter.update(drone_encounter_params)

      @drone_encounter.save

      render :new
    else
      @drone_encounter = DroneEncounter.new(drone_encounter_params
        .merge!({ team_id: @team.id, identifier: SecureRandom.hex }))


      if @drone_encounter.save

        session[:encounter_identifier] = @drone_encounter.identifier

        render :new
      end
    end
  end

  def reset
    session.delete(:team_identifier)
    session.delete(:encounter_identifier)

    redirect_to :drone_encounters
  end

  private

  def set_round_count
    @round_count = @drone_encounter.round_number
  end

  def set_drone_count
    @drone_count = @drone_encounter.drone_kills
  end

  def drone_encounter_params
    params.require(:drone_encounter).permit(:drone_kills, :round_number, :current_status)
  end

  def set_drone_encounters
    @drone_encounters = DroneEncounter.all.order('drone_kills DESC')

    @total_drones_killed = @drone_encounters.map(&:drone_kills).compact&.sum || 0
  end

  def set_encounter
    @drone_encounter = DroneEncounter.find_or_initialize_by(team: @team)
  end

  def set_team_session
    @team_session = session[:team_identifier]
  end

  def set_team
    @team = Team.find_by(identifier: @team_session) if @team_session
  end
end
