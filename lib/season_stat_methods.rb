class SeasonStatMethods
  attr_reader :games, :game_stats
  def initialize(games, stats)
    @games = games
    @game_stats = stats
  end

  def find_coach_by_season(id, season)
    home_or_away = nil
    game_link = all_games_of_season(season).find{|game| game.away_team_id == id || game.home_team_id == id}
    if game_link.away_team_id == id
      home_or_away = "away"
    else
      home_or_away = "home"
    end
    match = @game_stats.game_stats.find{|game| game.game_id == game_link.game_id.to_i && game.home_away == home_or_away}
    match.head_coach
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

  def find_num_games_played_won_in_season(season, team_id)
    results = {:games_played => 0, :games_won => 0}
    games = all_games_of_season(season)
    games.each do |game|
      if game.away_team_id == team_id || game.home_team_id == team_id
        results[:games_played] += 1
        result = find_winner_loser_of_game(game.game_id)
        if result[:winner] == team_id
          results[:games_won] += 1
        end
      end
    end
    results
  end

  def winningest_coach(season)
    best_percentage = 0
    team_ids = []
    games = all_games_of_season(season)

    games.each do |game|
      team_ids << game.away_team_id
      team_ids << game.away_team_id
    end
    team_ids = team_ids.uniq

    top_coach = nil
    count = 0
    games.each do |game|
      while count <= team_ids.length
        result = find_num_games_played_won_in_season(season, team_ids[count])
        percentage = result[:games_won].to_f / result[:games_played]
        if percentage > best_percentage
          best_percentage = percentage
          top_coach = team_ids[count]
        end
        count += 1
      end
    end
    find_coach_by_season(top_coach, season)
  end#winningest_coach

  def worst_coach(season)
    worst_percentage = 1000
    team_ids = []
    games = all_games_of_season(season)

    games.each do |game|
      team_ids << game.away_team_id
      team_ids << game.away_team_id
    end
    team_ids = team_ids.uniq

    worst_coach = nil
    count = 0
    games.each do |game|
      while count <= team_ids.length
        result = find_num_games_played_won_in_season(season, team_ids[count])
        percentage = result[:games_won].to_f / result[:games_played]
        if percentage < worst_percentage
          worst_percentage = percentage
          worst_coach = team_ids[count]
        end
        count += 1
      end
    end
    find_coach_by_season(worst_coach, season)
  end#worst_coach
end#class
