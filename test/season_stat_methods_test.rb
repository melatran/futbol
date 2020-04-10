require_relative 'test_helper'
require './lib/stat_tracker'
require './lib/game_collection'
require './lib/game_stats_collection'
require './lib/season_stat_methods'

class SeasonStatMethodsTest < Minitest::Test
  def setup
    @games = GameCollection.new('./test/fixtures/truncated_games2.csv')
    # @games = GameCollection.new('./data/games.csv')
    @stats =GameStatsCollection.new('./data/game_teams.csv')
    @season_stat_methods = SeasonStatMethods.new(@games, @stats)
  end

  def test_initialization_with_attributes
    assert_instance_of GameCollection, @games
    assert_equal @games, @season_stat_methods.games
  end

  def test_all_games_of_season
    assert_equal "2012020122", @season_stat_methods.all_games_of_season("20122013").first.game_id
    assert_equal "2012020495", @season_stat_methods.all_games_of_season("20122013").last.game_id
  end

  def test_find_coach_by_season
    assert_equal "Paul MacLean", @season_stat_methods.find_coach_by_season("9", "20122013")
  end

  def test_find_winner_loser_of_game
    result = {:winner => "9", :loser => "13"}
    assert_equal result, @season_stat_methods.find_winner_loser_of_game("2012020598")
  end

  def test_find_num_games_played_won_in_season
    result = {:games_played => 4, :games_won => 2}
    assert_equal result, @season_stat_methods.find_num_games_played_won_in_season("20122013", "9")
  end

  def test_winningest_coach
    assert_equal "John Hynes", @season_stat_methods.winningest_coach("20122013")
  end

  def test_worst_coach
    assert_equal "Gerard Gallant", @season_stat_methods.worst_coach("20122013")#20132014
  end






end
