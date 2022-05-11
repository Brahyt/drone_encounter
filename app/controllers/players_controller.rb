class PlayersController < ApplicationController
  MAX_PLAYERS = 4

  def new
    debugger
    @team = Team.find_by(identifier: session[:team_identifier])

    allowed_players = MAX_PLAYERS - @team.players.count

    allowed_players.times { @team.players.new }

    @players = @team.players
  end

  def create
  end
end
