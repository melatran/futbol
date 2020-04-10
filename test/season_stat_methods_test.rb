require_relative 'test_helper'
require './lib/stat_tracker'
require './lib/game_collection'
require './lib/season_stat_methods'

class SeasonStatMethodsTest < Minitest::Test
  def setup
    @games = GameCollection.new('./test/fixtures/truncated_games2.csv')
    # @games = GameCollection.new('./data/games.csv')
    @season_stat_methods = SeasonStatMethods.new(@games)
  end

  def test_initialization_with_attributes
    assert_instance_of GameCollection, @games
    assert_equal @games, @season_stat_methods.games
  end

  def test_all_games_of_season
    assert_equal "2012020122", @season_stat_methods.all_games_of_season("20122013").first.game_id
    assert_equal "2012020495", @season_stat_methods.all_games_of_season("20122013").last.game_id
  end

  def test_assemble_coaches_and_teams
    coaches_1213 = { "3"=>"John Tortorella", "6"=>"Claude Julien",
      "5"=>"Dan Bylsma", "17"=>"Mike Babcock", "16"=>"Joel Quenneville",
      "9"=>"Paul MacLean", "8"=>"Michel Therrien", "30"=>"Mike Yeo",
      "26"=>"Darryl Sutter", "19"=>"Ken Hitchcock", "24"=>"Bruce Boudreau",
      "2"=>"Jack Capuano", "15"=>"Adam Oates", "20"=>"Glen Gulutzan",
      "14"=>"Jon Cooper", "28"=>"Peter DeBoer", "4"=>"Dave Hakstol",
      "21"=>"Patrick Roy", "25"=>"Lindy Ruff", "13"=>"Gerard Gallant",
      "18"=>"Peter Laviolette", "10"=>"Mike Babcock", "29"=>"John Tortorella",
      "52"=>"Paul Maurice", "54"=>"Gerard Gallant", "1"=>"John Hynes",
      "23"=>"John Tortorella", "12"=>"Kirk Muller", "27"=>"Dave Tippett",
      "7"=>"Ron Rolston", "22"=>"Ralph Krueger", "53"=>"Dave Tippett" }
    assert_equal coaches_1213, @season_stat_methods.assemble_coaches_and_teams("20122013")
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
    skip
    assert_equal "John Hynes", @season_stat_methods.winningest_coach("20122013")
  end

  def test_worst_coach
    skip
    assert_equal "Gerard Gallant", @season_stat_methods.worst_coach("20122013")#20132014
  end






end
