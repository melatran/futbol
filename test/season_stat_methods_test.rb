require_relative 'test_helper'
require './lib/game_collection'
require './lib/season_stat_methods'
require './lib/game_stats_collection'
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

end
