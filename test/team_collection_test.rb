require_relative 'test_helper'

class TeamCollectionTest < Minitest::Test
  def setup
    @team_file_path =
    @team_data = CSV.read('./data/teams.csv',headers: true, header_converters: :symbol)
    @team_collection = TeamCollection.new(@team_data)
  end

  def test_it_exists
    assert_instance_of TeamCollection, @team_collection
  end

  def test_it_has_attributes
    assert_instance_of Array, @team_collection.teams
    assert_equal 32, @team_collection.teams.length
  end

  def test_it_can_create_teams_from_csv
    assert_instance_of Team, @team
  end

end
