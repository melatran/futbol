require 'csv'

require_relative 'game_collection'
require_relative 'game_stats_collection'
require_relative 'season_stat_methods'
class StatTracker
  attr_reader :games, :teams, :game_stats

  def self.from_csv(csv_files)
    #games = CSV.read(csv_files[:games], headers: true, header_converters: :symbol)
    games = GameCollection.new(csv_files[:games])
    teams = CSV.read(csv_files[:teams], headers: true, header_converters: :symbol)
    #game_stats = CSV.read(csv_files[:game_teams], headers: true, header_converters: :symbol)
    game_stats = GameStatsCollection.new(csv_files[:game_teams])
    StatTracker.new(games, teams, game_stats)
  end

  def initialize(game_path, team_path, game_teams_path)
    @games = game_path
    @teams = team_path
    @game_stats = game_teams_path
  end

  def winningest_coach(season)
    new = SeasonStatMethods.new(@games, @game_stats)
    new.winningest_coach(season)
  end

  def worst_coach(season)
    new = SeasonStatMethods.new(@games)
    new.worst_coach(season)
  end

end
