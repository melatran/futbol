require 'csv'
require_relative 'team_collection'

class GameStatsCollection
  attr_reader :game_stats

  def initialize(file_path)
    @game_stats = create_game_stats(file_path)
  end

  def create_game_stats(file_path)
    game_stats_csv = CSV.read("#{file_path}", headers: true, header_converters: :symbol)
    game_stats_csv.map { |row| GameStats.new(row)}
  end

  def goals_by_team_id
    @team_id_goals = {}
    @game_stats.each do |row|
      if @team_id_goals[row.team_id] == nil
        @team_id_goals[row.team_id] = [row.goals]
      else
        @team_id_goals[row.team_id] << row.goals
      end
    end
    @team_id_goals
  end

  def total_goals_by_team_id
    @team_id_total_goals = {}
    goals_by_team_id.each do |team_id, goals|
      @team_id_total_goals[team_id] = goals.sum
    end
    @team_id_total_goals
  end

  def average_goals_by_team_id
    team_id_average_goals = {}
    goals_by_team_id.each do |team_id, goals|
      team_id_average_goals[team_id] = (@team_id_total_goals[team_id].to_f / @team_id_goals[team_id].length).round(2)
    end
    team_id_average_goals
  end

  def best_offense_id
    (average_goals_by_team_id.max_by {|team_id, average_goals| average_goals})[0]
  end

  def find_team_name_by_team_id(team_id)
    @team_collection = TeamCollection.new('./data/teams.csv')
    (@team_collection.teams.find { |team| team.team_id == team_id}).teamname
  end
end
