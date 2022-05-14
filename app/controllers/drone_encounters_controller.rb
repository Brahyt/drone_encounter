# frozen_string_literal: true

# controller for displaying drone encounters
class DroneEncountersController < ApplicationController
  before_action :set_drone_encounters
  before_action :set_team_session
  before_action :set_team

  def index; end

  def new; end

  def form; end

  def set_drone_encounters
    @drone_encounters = DroneEncounter.all.order('drone_kills DESC')

    @total_drones_killed = @drone_encounters.map(&:drone_kills).compact&.sum || 0
  end

  def reset
    session.delete(:team_identifier)

    redirect_to :drone_encounters
  end

  private

  def set_team_session
    @team_session = session[:team_identifier]
  end

  def set_team
    @team = Team.find_by(identifier: @team_session) if @team_session
  end
end
