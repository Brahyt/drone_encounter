class PlayersController < ApplicationController
  before_action :set_available_heros, only: %i[new create]
  before_action :set_available_aspects, only: %i[new create]
  before_action :set_team, only: %i[new create]

  MAX_PLAYERS = 4

  def new
    allowed_players = MAX_PLAYERS - @team.players.count

    allowed_players.times { @team.players.new }

    @players = @team.players
  end

  def create
    @team.update(players_params)

    if @team.save
      turbo_stream.update 'drone_counter'
    else
      render :new
    end
  end

  private

  def set_available_heros
    @heroes = Hero.all.each_with_object([[nil, nil]])  do |hero, collection|
      collection << [hero.name, hero.id]
    end
  end

  def set_available_aspects
    @aspects = Aspect.all.each_with_object([[nil, nil]]) do |aspect, collection|
      collection << [aspect.name, aspect.id]
    end
  end

  def set_team
    @team = Team.find_by(identifier: session[:team_identifier])
  end

  def players_params
    params.require(:team).permit(players_attributes: %i[hero_id aspect_id id])
  end
end
