require 'test/unit'
require 'csv'

require_relative '../../lib/bowling_score/file_parser'

class FileParserTest < Test::Unit::TestCase
  include BowlingScore

  def setup
    @file_parsed_content = FileParser.new(file: 'input.txt')
  end

  def test_group_group_by_player
    assert_equal(expected_output, @file_parsed_content.group_rolls_by_player)
  end

  private

  def expected_output
    {
        "Jeff" => [10, 7, 3, 9, 0, 10, 0, 8, 8, 2, 0, 6, 10, 10, 10, 8, 1],
        "John" => [3, 7, 6, 3, 10, 8, 1, 10, 10, 9, 0, 7, 3, 4, 4, 10, 9, 0],
    }
  end
end