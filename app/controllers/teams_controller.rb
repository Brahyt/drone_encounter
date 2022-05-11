class TeamsController < ApplicationController
  def new
    @team = Team.new
  end

  def create
    @team = Team.new(team_params)

    if @team.save
      session[:team_identifier] = @team.identifier
      turbo_stream.update 'drone_counter'
    else
      render :new
    end
  end

  private

  def team_params
    params.require(:team).permit(:name).merge!(team_identifier)
  end

  def team_identifier
    {
      identifier: SecureRandom.hex
    }
  end
end
