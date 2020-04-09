require_relative 'test_helper'
require './lib/game_collection'
require './lib/season_stat_methods'
require 'mocha/minitest'

class SeasonStatMethodsTest < Minitest::Test
  def setup
    @games = GameCollection.new("./test/fixtures/truncated_games2.csv")
    @season_stat_methods = SeasonStatMethods.new(@games)
  end

  def test_initialization_with_attributes
    assert_instance_of GameCollection, @games
    assert_equal @games, @season_stat_methods.games
    assert_equal "Joel Quenneville", @season_stat_methods.all_coaches["16"]
  end

  def test_all_games_of_season
    assert_equal "2012020122", @season_stat_methods.all_games_of_season("20122013").first.game_id
    assert_equal "2012020495", @season_stat_methods.all_games_of_season("20122013").last.game_id
  end

  def test_find_winner_loser_of_game
    result = {:winner => "9", :loser => "4"}
    assert_equal result, @season_stat_methods.find_winner_loser_of_game("2012020598")
  end


end
