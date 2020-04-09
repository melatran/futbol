class SeasonStatMethods
  attr_reader :games, :all_coaches
  def initialize(games)
    @games = games
    @all_coaches = { "3"=>"John Tortorella", "6"=>"Claude Julien",
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
  end

  def all_games_of_season(season)
    @games.games_list.find_all{|game| game.season == season}
  end

  def find_winner_loser_of_game(game_id)
    results = {:winner => nil, :loser => nil}
    game = @games.games_list.find{|game| game.game_id == game_id}
    if game.home_goals > game.away_goals
      results[:winner] = game.home_team_id
      results[:loser] = game.away_team_id
    elsif game.home_goals < game.away_goals
      results[:winner] = game.away_team_id
      results[:loser] = game.home_team_id
    end
    results
  end



end#class
